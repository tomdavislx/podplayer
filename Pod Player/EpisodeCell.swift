//
//  EpisodeCell.swift
//  Pod Player
//
//  Created by Tom Davis on 15/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa
import WebKit


class EpisodeCell: NSTableCellView {

    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var pubDateLabel: NSTextField!
    @IBOutlet weak var descriptionWebView: WebView!
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
