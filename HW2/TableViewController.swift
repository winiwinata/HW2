//
//  TableViewController.swift
//  HW2
//
//  Created by WiseLab-HP on 2020/11/3.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var fruits = ["watermelon", "apple", "orange", "strawberry", "pear"]
    var prices = ["500", "100", "90", "200", "150"]
    var images = ["fruit", "fruit", "fruit", "fruit", "fruit"]
    var checked = Array(repeating: false, count: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = fruits[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named:images[indexPath.row])
        
        if checked[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to buy?", preferredStyle: .actionSheet)
        
        
        // these 6 lines of codes are only for iPads. without these, we can only run on iPhones
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Check-in action
        let checkAction = UIAlertAction(title: "Check", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.checked[indexPath.row] = true
            
            // modify !!!
            let sum = [Int]()
            sum.append([Int](prices[indexPath.row]))
            
        },
        optionMenu.addAction(checkAction)
        
        // Add Undo Check-in action
        let unCheckAction = UIAlertAction(title: "UnCheck", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            if self.checked[indexPath.row]{
                cell?.accessoryType = .none
                self.checked[indexPath.row] = false
            }
        })
    optionMenu.addAction(unCheckAction)
    
    // Add actions to the menu
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    optionMenu.addAction(cancelAction)
    
    // Display the menu
    present(optionMenu, animated: true, completion: nil)
    
    // Deselect a row
    tableView.deselectRow(at: indexPath, animated: false)
    
    // sum the prices ///////////////////////////
   
    }

}
