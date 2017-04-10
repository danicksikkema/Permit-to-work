//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tasksFromTemplate = ["Task 1", "Task 2", "Task 3", "Task 4"]
    var tasks = String()

    @IBOutlet weak var taskLabel: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func addTaskButton(_ sender: Any) {
        //getting input from Text Field
        tasks = taskLabel.text!
        
        //Displaying input text into label
        nameLabel.text = tasks
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set first question in label on loading
//        questionLabel.text = questions.first
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

