//
//  PermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 18-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//


import UIKit

class PermitTableViewController : UITableViewController {
    
    let permits = Permits.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permits.allPermits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        
        let permit = permits.allPermits[indexPath.row]
        
        cell.textLabel?.text = permit.name
        cell.detailTextLabel?.text = permit.name
        
        return cell
    }

}
