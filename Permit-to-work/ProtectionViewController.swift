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
    @IBOutlet weak var clothingProtectionButton: UIButton!
    
    var statusHeadProtection = true
    var statusEarProtection = true
    var statusclothingProtection = true
    
    var selected: [String] = []
    
    @IBAction func earProtectionButton(_ sender: UIButton) {
        switch statusEarProtection {
        case false:
            earProtectionButton.setImage( UIImage.init(named: "EarProtectionNormal"), for: .normal)
            print ("false")
            earProtectionButton.isSelected = false
            statusEarProtection = true
            
        case true:
            earProtectionButton.setImage( UIImage.init(named: "EarProtectionActive"), for: .selected)
            print("true")
            earProtectionButton.isSelected = true
            statusEarProtection = false
        }
    }
    
    @IBAction func headProtectionButton(_ sender: UIButton) {
        switch statusHeadProtection {
        case false:
            headProtectionButton.setImage( UIImage.init(named: "HeadGearNormal"), for: .normal)
            print ("false")
            headProtectionButton.isSelected = false
            statusHeadProtection = true
            
        case true:
            headProtectionButton.setImage( UIImage.init(named: "HeadGearActive"), for: .selected)
            print("true")
            headProtectionButton.isSelected = true
            statusHeadProtection = false
        }
    }
    
    @IBAction func clothingProtectionButton(_ sender: UIButton) {
        switch statusclothingProtection {
        case false:
            clothingProtectionButton.setImage( UIImage.init(named: "ClothingNormal"), for: .normal)
            print ("false")
            clothingProtectionButton.isSelected = false
            statusclothingProtection = true
            
        case true:
            clothingProtectionButton.setImage( UIImage.init(named: "ClothingActive"), for: .selected)
            print("true")
            clothingProtectionButton.isSelected = true
            statusclothingProtection = false
        }

    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
    }

    func findSelected () {
        if headProtectionButton.isSelected == true {
            selected.append("Hard Hat")
        } else {
            headProtectionButton.isSelected = false
        }
        
        if earProtectionButton.isSelected == true {
            selected.append("Ear Protection")
        } else {
            earProtectionButton.isSelected = false
        }
        
        if clothingProtectionButton.isSelected == true {
            selected.append("Reflective gear")
        } else {
            clothingProtectionButton.isSelected = false
        }
        
        print(selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
