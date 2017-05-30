//
//  NewPermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NewPermitViewController : UIViewController, UITextFieldDelegate {
    var permits = Permits.instance
    var templates = Templates.instance
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldDescription: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButton(_ sender: Any) {
        let name = textfieldName.text
        let type = textFieldType.text
        let description = textFieldDescription.text
        
            if (name?.isEmpty)! || (type?.isEmpty)! || (description?.isEmpty)! {
                
                let alertController = UIAlertController(title: "Missing input", message: "Alle velden moeten ingevuld worden", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            } else {
                let newPermitParameters: [String : Any] = ["permitId": 0, "permitName": textfieldName.text!, "type": Int((textFieldType?.text!)!)!, "workDescription": textFieldDescription.text!]
                
                print(newPermitParameters)
                
                Alamofire.request("http://avhx.com/api/v1/permits", method: .post, parameters: newPermitParameters, encoding: JSONEncoding.default).responseString { response in
                    
                    if response.result.value != nil {
                        print(response)
                        print(response.result)
                        print(response.result.isSuccess)
                    } else {
                        print("error")
                    }
                }
                
                let newPermit = Permit (fromJSON: newPermitParameters)
                
                let permits = Permits.instance
                permits.addNewPermit(permit: newPermit)
        
                // Empty textfields
                self.textfieldName.text = ""
                self.textFieldType.text = ""

                performSegue(withIdentifier: "goToProtection", sender: sender)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting the Delegate for the TextField
        textfieldName.delegate = self
        
        // Setting TextField styling
        
        let myColor : UIColor = UIColor(red: 0.3725, green: 0.5216, blue: 0.7529, alpha: 1.0)
        
        textfieldName.layer.borderColor = myColor.cgColor
        textfieldName.layer.cornerRadius = 8;
        textFieldType.layer.borderColor = myColor.cgColor
        textFieldType.layer.cornerRadius = 8;
        textFieldDescription.layer.borderColor = myColor.cgColor
        textFieldDescription.layer.cornerRadius = 8;
        
        textfieldName.layer.borderWidth = 1.0
        textFieldType.layer.borderWidth = 1.0
        textFieldDescription.layer.borderWidth = 1.0
        
        textFieldType.placeholder = ""
    }
}
