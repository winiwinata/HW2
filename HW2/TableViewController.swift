//
//  TableViewController.swift
//  HW2
//
//  Created by WiseLab-HP on 2020/11/3.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//  Wini Winata
//  410621334

import UIKit

class TableViewController: UITableViewController {
    
    var fruits = ["watermelon", "apple", "orange", "strawberry", "pear"]
    var prices = ["500", "100", "90", "200", "150"]
    var totalPrice: Int = 0
    
    @IBOutlet var total: UILabel!
    
    @IBOutlet weak var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = fruits[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //here, make an array to record the fruits chosen
        //then use loops to scan the array
        // then take the number and add it on the total prices
        
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
            // storing price at itemPrice
            if cell.accessoryType == .checkmark {
                totalPrice -= Int(prices[indexPath.row]) ?? 0
                cell.accessoryType = .none
            } else {
                totalPrice += Int(prices[indexPath.row]) ?? 0
                cell.accessoryType = .checkmark
            }
        }
        total.text = "Total Price = " + String(totalPrice)
    }
}

