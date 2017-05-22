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
    @IBOutlet weak var textFieldTools: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButton(_ sender: Any) {
        let name = textfieldName.text
        let tools = textFieldTools.text
        let type = textFieldType.text
        
            if (name?.isEmpty)! || (tools?.isEmpty)! || (type?.isEmpty)! {
                
                let alertController = UIAlertController(title: "Missing input", message: "Alle velden moeten ingevuld worden", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            } else {
                let newPermitParameters: [String : Any] = ["permitName": textfieldName.text!, "tools": textFieldTools.text!, "type": Int((textFieldType?.text!)!)!]
                
                Alamofire.request("http://avhx.com/api/tasks", method: .post, parameters: newPermitParameters, encoding: JSONEncoding.default).responseString { response in
                    
                    debugPrint(response)
                    
                    if response.result.value != nil {
                        let newPermit = Permit (fromJSON: newPermitParameters)
                        
                        print(newPermit)
                        
                        let permits = Permits.instance
                        permits.addNewPermit(permit: newPermit)
                    }
                }
                
                // Empty textfields
                self.textfieldName.text = ""
                self.textFieldTools.text = ""
                self.textFieldType.text = ""

                performSegue(withIdentifier: "showPermitStep", sender: sender)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting the Delegate for the TextField
        textfieldName.delegate = self
    }
}
