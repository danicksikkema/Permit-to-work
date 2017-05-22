//
//  PermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 08-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit
import Alamofire

class PermitViewController: UIViewController {
    
    let permits = Permits.instance
    
    @IBOutlet weak var namePermitTextField: UITextField!
    @IBOutlet weak var toolPermitTextField: UITextField!
    @IBOutlet weak var typePermitTextField: UITextField!
    
    @IBAction func showPermitSteps(_ sender: Any) {
        
    }
    
    var activePermit : Permit?
    
    override func viewWillAppear(_ animated: Bool) {
        if let permit = activePermit {
            namePermitTextField.text = permit.permitName
            toolPermitTextField.text = permit.permitTool
            typePermitTextField.text = "\(permit.permitType)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func EditPermitButton(_ sender: Any) {
        
        if let permit = activePermit {
            let permitId = permit.permitId
            
            let editPermitParameters: [String : Any] = ["permitId": permitId, "permitName": namePermitTextField.text!, "tools": toolPermitTextField.text!, "type": Int((typePermitTextField?.text!)!)!]
            
            Alamofire.request("http://avhx.com/api/tasks/\(permitId)", method: .put, parameters: editPermitParameters, encoding: JSONEncoding.default).responseString { response in
                
                debugPrint(response)
                
                if response.result.value != nil {
                    let newPermit = Permit (fromJSON: editPermitParameters)
                    
                    print(newPermit)
                    
                    // Permit moet aangepast worden in tableview
                    
//                    let permits = Permits.instance
//                    permits.editPermit(permit: editPermit)
                }
            }
            
            // Go back to
            let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
            
            present(mainNavigationController, animated: true, completion: nil)
        }
    }
    
    @IBAction func deletePermitButton(_ sender: Any) {
        if let permit = activePermit {
            let permitId = permit.permitId
            
            Alamofire.request("http://avhx.com/api/tasks/\(permitId)", method: .delete, encoding: JSONEncoding.default).responseString { response in
            
                debugPrint(response)
                
                if response.result.value != nil {
                    // Go back to
                    let mainNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
                    
                    self.present(mainNavigationController, animated: true, completion: nil)
                    
                // Permit moet verwijderd worden uit tableview
                }

            }
        }
    }
}
