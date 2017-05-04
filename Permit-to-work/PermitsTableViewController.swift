//
//  PermitsTableViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit

class PermitsTableViewController : UITableViewController {
    
    var permits = Permits.instance
    
    override func viewDidLoad() {

    }
    
    func verversTabel () {
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return permits.allPermits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: nil)
        
        let permit = permits.allPermits[indexPath.row]
        
        cell.textLabel?.text = permit.permitName
        cell.detailTextLabel?.text = String(describing: permit.permitType)
        
        return cell
    }
}
