//
//  PermitsTableViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PermitsTableViewController : UITableViewController {
    
    var permits = Permits.instance
    
    override func viewDidLoad() {
        let verversDing = UIRefreshControl()
        verversDing.addTarget(self, action: #selector(verversTabel), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = verversDing
        
        // Als er nieuwe klanten zijn worden die ingeladen door de verversTabel functie.
        NotificationCenter.default.addObserver(self, selector: #selector(verversTabel), name: Notification.Name("NewPermits"), object: nil)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let permit : Permit = permits.allPermits[indexPath.row]
        
        self.performSegue(withIdentifier: "toonPermit", sender: permit)
    }
    
    func refreshTable () {
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    // Func to delete value in row
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete {
//
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toonPermit" {
            let permit = sender as! Permit?
            let PermitViewController = segue.destination as!
            PermitViewController
            
            PermitViewController.activePermit = permit
        }
    }
}
