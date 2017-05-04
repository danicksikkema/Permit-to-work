//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var permitSteps = PermitSteps.instance
    
    let templateSteps = [["description1", "danger1"], ["description2", "danger2"], ["description3", "danger3"], ["description4", "danger4"]]
   
    @IBOutlet weak var stepTableView: UITableView!
    
    @IBOutlet weak var dangerLabel: UITextField!
    @IBOutlet weak var taskLabel: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        compareList ()
    }
    
    @IBAction func addStepButton(_ sender: Any) {

        let newPermitStep = PermitStep (stepDescription: taskLabel.text!, stepDanger: dangerLabel.text!)
        
        if (taskLabel.text?.characters.count)! > 0 && (dangerLabel.text?.characters.count)! >= 0 {
            permitSteps.addNewPermitStep(permitStep: newPermitStep)

            refreshTable()
            clearStepLabels()
            
        } else {
            alertMissingTaskMessage ()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dangerLabel.delegate = self
        self.taskLabel.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.stepTableView.reloadData()
        
    }
    
    // Hide keyboard when touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Hide keyboard when textfield returns
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
    
    func compareList () {
        
        // Get object array -> array of strings
        let userSteps = permitSteps.allPermitSteps.map({ (permitstep: PermitStep) -> [String] in
            [permitstep.stepDescription!, permitstep.stepDanger!]
        })
        
        // Zip templateSteps and userSteps in pairs and filter only the pairs who are not equal.
        let zippedSteps = zip(templateSteps, userSteps).enumerated().filter {$1.0 != $1.1}.map {$0.offset}
        
        // Print the rows which contain the not equal values.
        for zippedStep in zippedSteps {
            for i in 0..<zippedSteps.count {
                if zippedStep == i {
                    print ("fout zit in label \(i + 1)")
                }
            }
        }
    }
    
    
    func alertMissingTaskMessage () {
        let alertController = UIAlertController(title: "Missing task input", message: "Did you forget to fill in taskfield?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func notEqualMessage () {
        let alertController = UIAlertController(title: "Incorrect input", message: "The input of description or danger does not match the template", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func equalSuccesMessage () {
        let alertController = UIAlertController(title: "Good job!", message: "The task you filled in is correct!", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Func to delete value in row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            permitSteps.allPermitSteps.remove(at: indexPath.row)
            
            refreshTable()
        }
    }
    
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

