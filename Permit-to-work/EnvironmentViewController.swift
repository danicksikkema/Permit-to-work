//
//  EnvironmentViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class EnvironmentViewController : UIViewController {
    @IBOutlet weak var ToxicFumesButton: UIButton!
    @IBOutlet weak var SpilledWaterButton: UIButton!
    @IBOutlet weak var FireDangerButton: UIButton!
    
    @IBAction func ToxicFumesButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        switch sender.isSelected {
            case false:
                ToxicFumesButton.setImage( UIImage.init(named: "ToxicNormal"), for: .normal)
            
            case true:
                ToxicFumesButton.setImage( UIImage.init(named: "ToxicActive"), for: .selected)
        }
    }
    
    @IBAction func SpilledWaterButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                SpilledWaterButton.setImage( UIImage.init(named: "WaterNormal"), for: .normal)
            
            case true:
                SpilledWaterButton.setImage( UIImage.init(named: "WaterActive"), for: .selected)
        }
    }
    
    @IBAction func FireDangerButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
    
        switch sender.isSelected {
            case false:
                FireDangerButton.setImage( UIImage.init(named: "FireDangerNormal"), for: .normal)
            
            case true:
                FireDangerButton.setImage( UIImage.init(named: "FireDangerActive"), for: .selected)
        }
    }

    @IBOutlet weak var LoudNoiseButton: UIButton!
    @IBOutlet weak var SpilledWasteButton: UIButton!
    @IBOutlet weak var SlipperyFloorButton: UIButton!
    
    @IBAction func LoudNoiseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                LoudNoiseButton.setImage( UIImage.init(named: "LoudNoiseNormal"), for: .normal)
            
            case true:
                LoudNoiseButton.setImage( UIImage.init(named: "LoudNoiseActive"), for: .selected)
        }
    }
    
    @IBAction func SpilledWasteButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected

        switch sender.isSelected {
            case false:
                SpilledWasteButton.setImage( UIImage.init(named: "SpilledWasteNormal"), for: .normal)
            
            case true:
                SpilledWasteButton.setImage( UIImage.init(named: "SpilledWasteActive"), for: .selected)
        }
    }
    
    @IBAction func SlipperyFloorButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                SlipperyFloorButton.setImage( UIImage.init(named: "SlipperyFloorNormal"), for: .normal)
            
            case true:
                SlipperyFloorButton.setImage( UIImage.init(named: "SlipperyFloorActive"), for: .selected)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
        ValidateAndCreateFeedback ()
    }
    
    func findSelected () {
        let buttons: [UIButton] = [ToxicFumesButton, SpilledWaterButton, FireDangerButton, LoudNoiseButton, SpilledWasteButton, SlipperyFloorButton]

        for button in buttons {
            if button.isSelected == true {
                let parameters = ["name": (button.titleLabel?.text!)!]
                    
                Alamofire.request("http://avhx.com/api/v1/environment", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                        
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
        let buttonValidator: [UIButton] = [FireDangerButton]
        
        for button in buttonValidator {
            if button.isSelected == false {
                let parametersFeedback: [String : Any] = ["feedback": "Antwoord is fout! Je bent \(button.titleLabel!.text!) vergeten!", "score": 0 ]
                
                print(parametersFeedback)
                
                Alamofire.request("http://avhx.com/api/v1/environmentfb", method: .post, parameters: parametersFeedback, encoding: JSONEncoding.default).responseString { response in
                    
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
                
                Alamofire.request("http://avhx.com/api/v1/environmentfb", method: .post, parameters: parametersFeedback, encoding: JSONEncoding.default).responseString { response in
                    
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
