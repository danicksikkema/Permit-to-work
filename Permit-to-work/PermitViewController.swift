//
//  PermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 08-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit

class PermitViewController: UIViewController {
    @IBOutlet weak var namePermitLabel: UILabel!
    
    @IBAction func showPermitSteps(_ sender: Any) {
        
    }
    var activePermit : Permit?

    override func viewWillAppear(_ animated: Bool) {
        if let permit = activePermit {
            namePermitLabel.text = permit.permitName
        }
    }
}
