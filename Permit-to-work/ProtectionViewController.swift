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
import SwiftyJSON

class ProtectionViewController : UIViewController {
    
    // BUTTONS FIRST ROW
    
    // Setup Outlets for icons
    @IBOutlet weak var headProtectionButton: UIButton!
    @IBOutlet weak var earProtectionButton: UIButton!
    @IBOutlet weak var clothingProtectionButton: UIButton!
    @IBOutlet weak var weldingHelmetButton: UIButton!
    
    var statusHeadProtection = true
    var statusEarProtection = true
    var statusclothingProtection = true
    var statusHelmetButton = true
    
    // Setup Action buttons for icons
    
    // earProtection
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
    
    // weldingHelmet
    @IBAction func weldingHelmetButton(_ sender: UIButton) {
        switch statusHelmetButton {
        case false:
            weldingHelmetButton.setImage( UIImage.init(named: "weldingNormal"), for: .normal)
            print ("false")
            weldingHelmetButton.isSelected = false
            statusHelmetButton = true
            
        case true:
            weldingHelmetButton.setImage( UIImage.init(named: "weldingActive"), for: .selected)
            print("true")
            weldingHelmetButton.isSelected = true
            statusHelmetButton = false
        }
    }
    
    // headProtection
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
    
    // clothingProtection
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

    
    // BUTTONS SECOND ROW
    
    // Setup Outlets for icons
    @IBOutlet weak var cleanHandsButton: UIButton!
    @IBOutlet weak var fireProtectionButton: UIButton!
    @IBOutlet weak var bootsProtectionButton: UIButton!
    @IBOutlet weak var glovesProtectionButton: UIButton!
    
    var statusHandsProtection = true
    var statusFireProtection = true
    var statusBootsProtection = true
    var statusGlovesButton = true
    
    
    @IBAction func cleanHandsButton(_ sender: UIButton) {
        switch statusHandsProtection {
        case false:
            cleanHandsButton.setImage( UIImage.init(named: "HandsNormal"), for: .normal)
            print ("false")
            cleanHandsButton.isSelected = false
            statusHandsProtection = true
            
        case true:
            cleanHandsButton.setImage( UIImage.init(named: "HandsActive"), for: .selected)
            print("true")
            cleanHandsButton.isSelected = true
            statusHandsProtection = false
        }
    }
    
    @IBAction func fireProtectionButton(_ sender: UIButton) {
        switch statusFireProtection {
        case false:
            fireProtectionButton.setImage( UIImage.init(named: "FireNormal"), for: .normal)
            print ("false")
            fireProtectionButton.isSelected = false
            statusFireProtection = true
            
        case true:
            fireProtectionButton.setImage( UIImage.init(named: "FireActive"), for: .selected)
            print("true")
            fireProtectionButton.isSelected = true
            statusFireProtection = false
        }
    }
    
    @IBAction func bootsProtectionButton(_ sender: UIButton) {
        switch statusBootsProtection {
        case false:
            bootsProtectionButton.setImage( UIImage.init(named: "BootsNormal"), for: .normal)
            print ("false")
            bootsProtectionButton.isSelected = false
            statusBootsProtection = true
            
        case true:
            bootsProtectionButton.setImage( UIImage.init(named: "BootsActive"), for: .selected)
            print("true")
            bootsProtectionButton.isSelected = true
            statusBootsProtection = false
        }
    }
    
    
    @IBAction func glovesProtectionButton(_ sender: UIButton) {
        switch statusGlovesButton {
        case false:
            glovesProtectionButton.setImage( UIImage.init(named: "GlovesNormal"), for: .normal)
            print ("false")
            glovesProtectionButton.isSelected = false
            statusGlovesButton = true
            
        case true:
            glovesProtectionButton.setImage( UIImage.init(named: "GlovesActive"), for: .selected)
            print("true")
            glovesProtectionButton.isSelected = true
            statusGlovesButton = false
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
    }

    func findSelected () {
        let buttons: [UIButton] = [headProtectionButton, earProtectionButton, clothingProtectionButton, weldingHelmetButton, cleanHandsButton, fireProtectionButton, bootsProtectionButton, glovesProtectionButton]
        
        for button in buttons {
            if button.isSelected == true {
                if button == headProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Hard Hat"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == earProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Ear Protection"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == clothingProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Reflective Gear"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == cleanHandsButton {
                    let parameters: [String: Any] = ["personalProtection": "Clean Hands"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == fireProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Fire Extinguisher"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == bootsProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Protective Boots"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                }
                
                if button == glovesProtectionButton {
                    let parameters: [String: Any] = ["personalProtection": "Protective Boots"]
                    
                    Alamofire.request("http://avhx.com/api/v1/protection", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
                        if response.result.value != nil {
                            debugPrint(response)
                            print(response.result)
                            print(response.result.isSuccess)
                        } else {
                            print("error")
                        }
                    }
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
