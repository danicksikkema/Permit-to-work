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
        compareArray ()
        findFaultLabel()
        
        //        let checkIndex = zip(templateSteps, userSteps).enumerated().filter {$1.0 != $1.1}.map {$0.0}
        //        print(checkIndex)

    }
    
    @IBAction func addStepButton(_ sender: Any) {
        let newPermitStep = PermitStep (stepDescription: taskLabel.text!, stepDanger: dangerLabel.text!)

        if (taskLabel.text?.characters.count)! > 0 && (dangerLabel.text?.characters.count)! >= 0 {
            permitSteps.addNewPermitStep(permitStep: newPermitStep)
            // Check if filled in answer is the same as in the template.
            compareArray ()

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
    
    func compareArray () {
        // Get object array -> array of strings
        let userSteps = permitSteps.allPermitSteps.map({ (permitstep: PermitStep) -> [String] in
            [permitstep.stepDescription, permitstep.stepDanger]
        })
        
        // Compare elements from both arrays, and when elements are not equal give a warning message.
        for (e1, e2) in zip(templateSteps, userSteps) {
            if "\(e1)".lowercased().range(of: "\(e2)") != nil {
                // do nothing
            } else {
                let alertController = UIAlertController(title: "Reminder", message: "Did you forget this part: \(e1)?", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func findFaultLabel () {
        let userSteps = permitSteps.allPermitSteps.map({ (permitstep: PermitStep) -> [String] in
            [permitstep.stepDescription, permitstep.stepDanger]
        })
        
        let checkIndex = zip(templateSteps, userSteps).enumerated().filter {$1.0 != $1.1}.map {$0.0}
        
        print(checkIndex)
        for getal in checkIndex {
            
            switch getal {
            case 0:
                print("Fout zit in label 1")
            case 1:
                print("Fout zit in label 2")
            case 2:
                print("Fout zit in label 3")
            case 3:
                print("Fout zit in label 4")
            default:
                print("Geen fouten")
            }
        }
    }
    
    func alertMissingTaskMessage () {
        let alertController = UIAlertController(title: "Missing task input", message: "Did you forget to fill in taskfield?", preferredStyle: .alert)
        
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

