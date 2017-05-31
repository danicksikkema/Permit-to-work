//
//  ProtectionViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit

class ProtectionViewController : UIViewController {
    
    
    @IBOutlet weak var headProtectionButton: UIButton!
    @IBOutlet weak var earProtectionButton: UIButton!
    
    @IBAction func headProtectionButton(_ sender: AnyObject) {
        checkSelected()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
    }
    var status = true
    var selected: [String] = []
    
    func checkSelected () {
        switch status {
        case false:
            headProtectionButton.setImage( UIImage.init(named: "HeadGearNormal"), for: .normal)
            print ("false")
            headProtectionButton.isSelected = false
            status = true
            
        case true:
            headProtectionButton.setImage( UIImage.init(named: "HeadGearActive"), for: .selected)
            print("true")
            headProtectionButton.isSelected = true
            status = false
        }
    }
    
    func findSelected () {
        if headProtectionButton.isSelected == true {
            selected.append("Hard Hat")
            print(selected)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
