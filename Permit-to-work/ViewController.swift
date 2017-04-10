//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tasksFromTemplate = ["Task 1", "Task 2", "Task 3", "Task 4"]
    var tasksArray: [String] = []

    @IBOutlet weak var taskLabel: UITextField!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        // Getting input from Text Field
        let taskValue = [taskLabel.text!]
        
        // Task for loop
        for i in taskValue {
            // If textlabel is empty do nothing
            if i == "" {
                print("textlabel is empty")
            }
            // Add it to the Array
            else {
                tasksArray.append(String(i))
                
                // Displaying input text into label
                refreshTable()
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasksArray.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = tasksArray[indexPath.row]
        
        return (cell)
    }
    
    func refreshTable () {
        self.taskTableView.reloadData()
        self.taskTableView.refreshControl?.endRefreshing()
        print("refreshed")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

