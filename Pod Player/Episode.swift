//
//  Episode.swift
//  Pod Player
//
//  Created by Tom Davis on 15/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Cocoa

class Episode {
    var title = ""
    var pubDate = Date()
    var htmlDescription = ""
    var audioURL = ""
    
     static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        return formatter
    }()
}
