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

class NewPermitViewController : UIViewController {
    var permits = Permits.instance
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textFieldTools: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldDanger: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        
        let newPermitParameters: [String : Any] = ["permitName": textfieldName.text!, "tools": textFieldTools.text!, "type": textFieldType.text!, "danger": textFieldDanger.text!]
        
        if ((textfieldName.text?.characters.count)! > 0) && ((textFieldTools.text?.characters.count)! > 0) && ((textFieldType.text?.characters.count)! > 0) && ((textFieldDanger.text?.characters.count)! > 0)  {
        
            Alamofire.request("http://avhx.com/api/tasks", method: .post, parameters: newPermitParameters, encoding: JSONEncoding.default).responseString { response in
            
                // Empty textfields
                self.textfieldName.text = ""
                self.textFieldTools.text = ""
                self.textFieldType.text = ""
                self.textFieldDanger.text = ""
                
                debugPrint(response)
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            }
        } else {
            alertMissingTaskMessage ()
        }
    }
    
    func alertMissingTaskMessage () {
        let alertController = UIAlertController(title: "Missing task input", message: "Did you forget to fill in taskfield?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

