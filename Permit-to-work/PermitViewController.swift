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
    @IBOutlet weak var typePermitTextField: UITextField!
    
    @IBAction func showPermitSteps(_ sender: Any) {
        
    }
    
    var activePermit : Permit?
    
    override func viewWillAppear(_ animated: Bool) {
        if let permit = activePermit {
            namePermitTextField.text = permit.permitName
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
            
            let editPermitParameters: [String : Any] = ["permitId": permitId, "permitName": namePermitTextField.text!, "type": Int((typePermitTextField?.text!)!)!]
            
            Alamofire.request("http://avhx.com/api/v1/permits/\(permitId)", method: .put, parameters: editPermitParameters, encoding: JSONEncoding.default).responseString { response in
                
                if response.result.value != nil {
                    
                    print(response)
                    print(response.result)
                    print(response.result.isSuccess)
                
                } else {
                    print("error")
                }
                
                if response.result.isSuccess {
                    let editPermit = Permit (fromJSON: editPermitParameters)
                    
                    let permits = Permits.instance
                    permits.editPermit(permit: editPermit)
                } else {
                    print("error")
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
            
            Alamofire.request("http://avhx.com/api/v1/permits/\(permitId)", method: .delete, encoding: JSONEncoding.default).responseString { response in
                
                if response.result.value != nil {
                    
                    print(response)
                    print(response.result)
                    print(response.result.isSuccess)

                } else {
                    print("error")
                }
                
                if response.result.isSuccess {
                    let permits = Permits.instance
                    permits.deletePermit(permit: permit)
                } else {
                    print("error")
                }
            }
            
        // Go back to
        let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
            
        present(mainNavigationController, animated: true, completion: nil)
        }
    }
}
