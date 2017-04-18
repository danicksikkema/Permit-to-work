//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var stepTableView: UITableView!
    
    @IBOutlet weak var dangerLabel: UITextField!
    @IBOutlet weak var taskLabel: UITextField!
    
    @IBAction func compareArrayButton(_ sender: Any) {
        
    }
    
    @IBAction func addStepButton(_ sender: Any) {
        let newPermitStep = PermitStep (stepDescription: taskLabel.text!, stepDanger: dangerLabel.text!)
        
        let permitSteps = PermitSteps.instance

        if (taskLabel.text?.characters.count)! > 0 && (dangerLabel.text?.characters.count)! >= 0 {
            permitSteps.addNewPermitStep(permitStep: newPermitStep)
            refreshTable()
            clearStepLabels()
        }
            
        else {
            alertMissingTaskMessage ()
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
        self.stepTableView.reloadData()
    }

        
    func refreshTable () {
        self.stepTableView.reloadData()
        self.stepTableView.refreshControl?.endRefreshing()
    }
    
    func clearStepLabels () {
        // Empty the labels.
        taskLabel.text = ""
        dangerLabel.text = ""
    }
    
    func alertMissingTaskMessage () {
        let alertController = UIAlertController(title: "Missing task input", message: "Did you forget to fill in taskfield?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    let permitSteps = PermitSteps.instance
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permitSteps.allPermitSteps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        
        let permitStep = permitSteps.allPermitSteps[indexPath.row]
        
        cell.textLabel?.text = permitStep.stepDescription
        cell.detailTextLabel?.text = permitStep.stepDanger
        return cell
    }
    
}

