//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // List of steps with steps and dangers from template model.
    let template: [String: String] = ["description 1": "danger 1", "description 2": "danger 2"]
    
    // List of permit with filled in steps and dangers by employee.
    var permit: [String] = []

    @IBOutlet weak var taskLabel: UITextField!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func compareArrayButton(_ sender: Any) {
        
    }
    @IBAction func addTaskButton(_ sender: Any) {
        
        // Getting input from Text Field.
        let stepDescription = [taskLabel.text!]
        
        // For loop to add a description to permit array.
        for i in stepDescription {
            // If textlabel is empty do nothing.
            if i == "" {
                print("textlabel is empty")
            }
            // Add it to the Array.
            else {
                permit.append(String(i))
                taskLabel.text = ""
                
                // Displaying input text into label.
                refreshTable()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.taskTableView.reloadData()
    }
    
//    func areArrayTasksEqual(tasksFromTemplate:[Person], tasksArray: [Person]) -> Bool {
//        
//    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (permit.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = permit[indexPath.row]
        
        return (cell)
    }
    
    func refreshTable () {
        self.taskTableView.reloadData()
        self.taskTableView.refreshControl?.endRefreshing()
    }
    
}

