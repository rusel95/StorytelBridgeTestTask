//
//  ListTableViewController.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit
import AlamofireImage

class ListTableViewController: UITableViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentList()
        
    }
    
    var currentList = List() {
        didSet {
            setView(with: currentList)
            tableView.reloadData()
            setView(with: currentList)
        }
    }
    
    private func getCurrentList() {
        StorytelBridgeApi.shared.getList { list in
            if list != nil {
                self.currentList = list!
            } else {
                print("alert about fall down")
            }
        }
    }
    
    private func setView(with list: List) {
        coverImage.setImage(with: list.coverURL)
       
        titleLabel.text = list.title
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        
        cell.setCell(with: currentList.books[indexPath.row])

        return cell
    }
}
