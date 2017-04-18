//
//  NewPermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 18-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var dangerLabel: UITextField!
    
    
    
    

    let newPermit = Permit (naam: naamKlantVeld.text!, leeftijd: 0, krediet: 0)
    
    let permits = Permits.instance
    permit.addNewPermit(permit: newPermit)

}
