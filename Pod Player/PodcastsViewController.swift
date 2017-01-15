//
//  PodcastsViewController.swift
//  Pod Player
//
//  Created by Tom Davis on 08/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa

class PodcastsViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    @IBOutlet weak var podcastURLTextField: NSTextField!
    
    @IBOutlet weak var tableView: NSTableView!
    
    var podcasts : [Podcast] = []
    var episodesVC : EpisodesViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        podcastURLTextField.stringValue = "http://www.bbc.co.uk/programmes/p02nrv1j/episodes/downloads.rss"
        
        getPodcasts()
    }
    
    func getPodcasts() {
        
        if let context = (NSApplication.shared().delegate as? AppDelegate)?.managedObjectContext {
            
            let fetchy = Podcast.fetchRequest() as NSFetchRequest<Podcast>
            fetchy.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
            
            do {
                podcasts = try context.fetch(fetchy)
                
                print(podcasts)
            } catch {}
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    @IBAction func addPodcastClicked(_ sender: Any) {
        
        if let url = URL(string: podcastURLTextField.stringValue) {
            
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                
                if error != nil {
                    print(error!)
                } else {
                    if data != nil {
                        let parser = Parser()
                        let info = parser.getPodcastMetaData(data: data!)
                        
                        if !self.podcastExists(rssURL: self.podcastURLTextField.stringValue) {
                            
                            if let context = (NSApplication.shared().delegate as? AppDelegate)?.managedObjectContext {
                                let podcast = Podcast(context: context)
                                
                                podcast.rssURL = self.podcastURLTextField.stringValue
                                podcast.imageURL = info.imageURL
                                podcast.title = info.title
                                
                                (NSApplication.shared().delegate as? AppDelegate)?.saveAction(nil)
                                
                                self.getPodcasts()
                            }
                        }
                    }
                }
                }.resume()
            
            podcastURLTextField.stringValue = ""
        }
    }
    
    func podcastExists(rssURL:String) -> Bool {
        if let context = (NSApplication.shared().delegate as? AppDelegate)?.managedObjectContext {
            
            let fetchy = Podcast.fetchRequest() as NSFetchRequest<Podcast>
            fetchy.predicate = NSPredicate(format: "rssURL == %@", rssURL)
            
            
            do {
                let matchingPodcasts = try context.fetch(fetchy)
                
                if matchingPodcasts.count >= 1 {
                    return true
                } else {
                    return false
                }
            } catch {}
        }
        
        return false
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return podcasts.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.make(withIdentifier: "podcastcell", owner: self) as? NSTableCellView
        
        let podcast = podcasts[row]
        
        if podcast.title != nil {
            cell?.textField?.stringValue = podcast.title!
        } else {
            cell?.textField?.stringValue = "UNKNOWN ITEM"
        }
        return cell
        
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        if tableView.selectedRow >= 0 {
            let podcast = podcasts[tableView.selectedRow]
            episodesVC?.podcast = podcast
            episodesVC?.updateView()
            
            
        }
    }
}



