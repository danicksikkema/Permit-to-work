//
//  NewPermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit

class NewPermitViewController : UIViewController {
    var permits = Permits.instance
    
    @IBOutlet weak var textfieldName: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        
        let newPermit = Permit (permitName: textfieldName.text!, permitType: 0)
        
        if (textfieldName.text?.characters.count)! > 0 {
            permits.addNewPermit(permit: newPermit)
            textfieldName.text = ""
            print("opgeslagen")
            
        } else {
            print("niet ingevuld")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

