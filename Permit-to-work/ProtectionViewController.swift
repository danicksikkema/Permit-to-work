//
//  ProtectionViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ProtectionViewController : UIViewController {
    
    // BUTTONS FIRST ROW
    
    // Setup Outlets for icons
    @IBOutlet weak var headProtectionButton: UIButton!
    @IBOutlet weak var earProtectionButton: UIButton!
    @IBOutlet weak var clothingProtectionButton: UIButton!
    @IBOutlet weak var weldingHelmetButton: UIButton!
    
    // earProtection
    @IBAction func earProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        switch sender.isSelected {
            case false:
                earProtectionButton.setImage( UIImage.init(named: "EarProtectionNormal"), for: .normal)
            
            case true:
                earProtectionButton.setImage( UIImage.init(named: "EarProtectionActive"), for: .selected)
        }
    }
    
    // weldingHelmet
    @IBAction func weldingHelmetButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                weldingHelmetButton.setImage( UIImage.init(named: "weldingNormal"), for: .normal)
            
            case true:
                weldingHelmetButton.setImage( UIImage.init(named: "weldingActive"), for: .selected)
        }
    }
    
    // headProtection
    @IBAction func headProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                headProtectionButton.setImage( UIImage.init(named: "HeadGearNormal"), for: .normal)
            
            case true:
                headProtectionButton.setImage( UIImage.init(named: "HeadGearActive"), for: .selected)
        }
    }
    
    // clothingProtection
    @IBAction func clothingProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                clothingProtectionButton.setImage( UIImage.init(named: "ClothingNormal"), for: .normal)
            
            case true:
                clothingProtectionButton.setImage( UIImage.init(named: "ClothingActive"), for: .selected)
        }
    }
    
    // BUTTONS SECOND ROW
    
    // Setup Outlets for icons
    @IBOutlet weak var cleanHandsButton: UIButton!
    @IBOutlet weak var fireProtectionButton: UIButton!
    @IBOutlet weak var bootsProtectionButton: UIButton!
    @IBOutlet weak var glovesProtectionButton: UIButton!
    
    @IBAction func cleanHandsButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        switch sender.isSelected {
            case false:
                cleanHandsButton.setImage( UIImage.init(named: "HandsNormal"), for: .normal)
            
            case true:
                cleanHandsButton.setImage( UIImage.init(named: "HandsActive"), for: .selected)
        }
    }
    
    @IBAction func fireProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                fireProtectionButton.setImage( UIImage.init(named: "FireNormal"), for: .normal)
            
            case true:
                fireProtectionButton.setImage( UIImage.init(named: "FireActive"), for: .selected)
        }
    }
    
    @IBAction func bootsProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                bootsProtectionButton.setImage( UIImage.init(named: "BootsNormal"), for: .normal)
            
            case true:
                bootsProtectionButton.setImage( UIImage.init(named: "BootsActive"), for: .selected)
        }
    }
    
    @IBAction func glovesProtectionButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        switch sender.isSelected {
        case false:
            glovesProtectionButton.setImage( UIImage.init(named: "GlovesNormal"), for: .normal)
            
        case true:
            glovesProtectionButton.setImage( UIImage.init(named: "GlovesActive"), for: .selected)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
        ValidateAndCreateFeedback ()
    }

    func findSelected () {
        let buttons: [UIButton] = [headProtectionButton, earProtectionButton, clothingProtectionButton, weldingHelmetButton, cleanHandsButton, fireProtectionButton, bootsProtectionButton, glovesProtectionButton]
        
        for button in buttons {
            if button.isSelected == true {
                let parametersSelectie = ["name": (button.titleLabel?.text!)!]
                
                Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parametersSelectie, encoding: JSONEncoding.default).responseString { response in
                        
                    if response.result.value != nil {
                        debugPrint(response)
                        print(response.result)
                        print(response.result.isSuccess)
                    } else {
                        print("error")
                    }
                }
            } else {
                print("niet geselecteerd")
            }
        }
    }
    
    func ValidateAndCreateFeedback () {
        
        // Deze buttons moeten geselecteerd worden
        let buttonValidator: [UIButton] = [weldingHelmetButton, fireProtectionButton]
        
        for button in buttonValidator {
            if button.isSelected == false {
                let parametersFeedback: [String : Any] = ["feedback": "Antwoord is fout! Je bent \(button.titleLabel!.text!) vergeten!", "score": 0 ]
                
                print(parametersFeedback)
                
                Alamofire.request("http://avhx.com/api/v1/protectionfb", method: .post, parameters: parametersFeedback, encoding: JSONEncoding.default).responseString { response in
                    
                    if response.result.value != nil {
                        debugPrint(response)
                        print(response.result)
                        print(response.result.isSuccess)
                    } else {
                        print("error")
                    }
                }
            } else {
                let parametersFeedback: [String : Any] = ["feedback": "Antwoord is goed! Je hebt \(button.titleLabel!.text!) gekozen!", "score": 10 ]
                
                print(parametersFeedback)
                
                Alamofire.request("http://avhx.com/api/v1/protectionfb", method: .post, parameters: parametersFeedback, encoding: JSONEncoding.default).responseString { response in
                    
                    if response.result.value != nil {
                        debugPrint(response)
                        print(response.result)
                        print(response.result.isSuccess)
                    } else {
                        print("error")
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
