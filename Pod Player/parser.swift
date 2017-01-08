//
//  parser.swift
//  Pod Player
//
//  Created by Tom Davis on 08/01/2017.
//  Copyright © 2017 Tom Davis. All rights reserved.
//

import Foundation

class Parser {
    
    func getPodcastMetaData(data:Data) -> (title:String?, imageURL:String?) {
        
        let xml = SWXMLHash.parse(data)
        
        print(xml["rss"]["channel"]["itunes:image"].element?.attribute(by: "href")?.text)
        
        return (xml["rss"]["channel"]["title"].element?.text, xml["rss"]["channel"]["title"].element?.text)
               
    }
}
