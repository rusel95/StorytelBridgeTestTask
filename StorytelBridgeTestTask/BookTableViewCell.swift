//
//  BookTableViewCell.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit
import AlamofireImage

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var narratorsLabel: UILabel!
    
    func setCell(with book: Book) {
        
        bookImage.af_setImage(withURL: URL(fileURLWithPath: book.coverUrl ) )
        
        bookTitle.text = book.title
        
        authorsLabel.text = "By: "
        for i in 0..<book.authors.count {
            authorsLabel?.text?.append( book.authors[i] )
            if i != book.authors.count {
                authorsLabel.text?.append(", ")
            }
        }
        
        narratorsLabel.text = "With: "
        for narrator in book.narrators {
            narratorsLabel?.text?.append( narrator )
            if narrator != book.authors.last {
                narratorsLabel?.text?.append(", ")
            }
        }
        
    }
    

}
