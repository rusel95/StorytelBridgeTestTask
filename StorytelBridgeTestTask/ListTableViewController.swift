//
//  ListTableViewController.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private var neededPage = 0
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNeededList()
    }
    
    var currentList = List() {
        didSet {
            setView(with: currentList)
            tableView.reloadData()
            setView(with: currentList)
        }
    }
    
    private func getNeededList() {
        StorytelBridgeApi.shared.getList(on: neededPage) { list in
            if list != nil {
                if self.neededPage > 0 {
                    
                    let tempList = self.currentList
                    for book in (list?.books)! {
                        tempList.books.append(book)
                    }
                    self.currentList = tempList
                } else {
                    self.currentList = list!
                }
                self.neededPage += 1
            } else {
                print("alert is needed - looks list is nil - no result")
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
        
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
            
            getNeededList()
        }

        return cell
    }
    
}
