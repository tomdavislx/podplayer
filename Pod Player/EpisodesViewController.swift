//
//  EpisodesViewController.swift
//  Pod Player
//
//  Created by Tom Davis on 15/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa

class EpisodesViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var imageview: NSImageView!
    @IBOutlet weak var pausePlayButton: NSButton!
    
    var podcast : Podcast? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func updateView() {
        if podcast?.title != nil {
            titleLabel.stringValue = podcast!.title!
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
    }
    @IBAction func pausePlayClicked(_ sender: Any) {
        
    }
}
