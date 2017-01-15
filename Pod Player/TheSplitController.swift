//
//  TheSplitController.swift
//  Pod Player
//
//  Created by Tom Davis on 15/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa

class TheSplitController: NSSplitViewController {
    
    @IBOutlet weak var podcastsItem: NSSplitViewItem!
    @IBOutlet weak var episodesItem: NSSplitViewItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        if let podcastsVC = podcastsItem.viewController as? PodcastsViewController {
            if let episodesVC = episodesItem.viewController as? EpisodesViewController {
                podcastsVC.episodesVC = episodesVC
            }
        }
    }
}
