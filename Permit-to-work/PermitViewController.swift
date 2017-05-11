//
//  PermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 08-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class PermitViewController: UIViewController {
    

    @IBOutlet weak var idPermitTextField: UITextField!
    @IBOutlet weak var namePermitTextField: UITextField!
    @IBOutlet weak var toolPermitTextField: UITextField!
    @IBOutlet weak var typePermitTextField: UITextField!
    @IBOutlet weak var dangerPermitTextField: UITextField!
    
    @IBAction func showPermitSteps(_ sender: Any) {
        
    }
    
    @IBAction func EditPermitButton(_ sender: Any) {
        let editPermitParameters: [String : Any] = ["permitId": idPermitTextField.text!, "permitName": namePermitTextField.text!, "tools": toolPermitTextField.text!, "type": typePermitTextField.text!, "danger": dangerPermitTextField.text!]
        
        Alamofire.request("http://avhx.com/api/tasks/28", method: .put, parameters: editPermitParameters, encoding: JSONEncoding.default).responseString { response in
            
            print(editPermitParameters)
            
            debugPrint(response)
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }

        }
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
}
