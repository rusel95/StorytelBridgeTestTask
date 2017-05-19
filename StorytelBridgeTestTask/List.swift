//
//  List.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Book {
    var authors = [String]()
    var narrators = [String]()
    var title = String()
    var coverUrl = String()
    
    init(metadata: JSON) {
        let tempAuthors = metadata["authors"].array
        for tempAuthor in tempAuthors! {
            self.authors.append(tempAuthor["name"].string!)
        }
        
        let tempNarrators = metadata["narrators"].array
        for tempNarrator in tempNarrators! {
            self.narrators.append(tempNarrator["name"].string!)
        }
        
        self.title = metadata["title"].string!
        
        self.coverUrl = metadata["cover"]["url"].string!
    }
}

class List {
    
    var title = String()
    var coverURL = String()
    
    var books = [Book]()
    
    init() {
        
    }
    
    init(response: Any?) {
        let json = JSON(response!)
        
        let metadata = json["metadata"]
        self.title = metadata["title"].string!
        self.coverURL = metadata["cover"]["url"].string!
        
        let consumables = json["consumables"].array
        
        for consumable in consumables! {
            let book = Book(metadata: consumable["metadata"])
            books.append(book)
        }
    }
}
