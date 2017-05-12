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
    
    @IBOutlet weak var idPermitTextField: UITextField!
    @IBOutlet weak var namePermitTextField: UITextField!
    @IBOutlet weak var toolPermitTextField: UITextField!
    @IBOutlet weak var typePermitTextField: UITextField!
    @IBOutlet weak var dangerPermitTextField: UITextField!
    
    @IBAction func showPermitSteps(_ sender: Any) {
        
    }
    
    var activePermit : Permit?
    
    override func viewWillAppear(_ animated: Bool) {
        if let permit = activePermit {
            namePermitTextField.text = permit.permitName
            toolPermitTextField.text = permit.permitTool
            typePermitTextField.text = "\(permit.permitType)"
            dangerPermitTextField.text = permit.permitDanger
            idPermitTextField.text = "\(permit.permitId)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func EditPermitButton(_ sender: Any) {

        let editPermitParameters: [String : Any] = ["permitId": idPermitTextField.text!, "permitName": namePermitTextField.text!, "tools": toolPermitTextField.text!, "type": typePermitTextField.text!, "danger": dangerPermitTextField.text!]
        
        if let permit = activePermit {
            let permitId = permit.permitId
            
            Alamofire.request("http://avhx.com/api/tasks/\(permitId)", method: .put, parameters: editPermitParameters, encoding: JSONEncoding.default).responseString { response in
                
                print(editPermitParameters)
                
                debugPrint(response)
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            }
        }
    }
}
