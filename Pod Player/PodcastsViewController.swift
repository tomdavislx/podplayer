//
//  PodcastsViewController.swift
//  Pod Player
//
//  Created by Tom Davis on 08/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa

class PodcastsViewController: NSViewController {
    
    @IBOutlet weak var podcastURLTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        podcastURLTextField.stringValue = "http://www.bbc.co.uk/programmes/p02nrv1j/episodes/downloads.rss"
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
                    }
                }
                }.resume()
            
            podcastURLTextField.stringValue = ""
        }
    }
}
