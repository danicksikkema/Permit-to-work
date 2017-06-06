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
        
        var statusToxic = !sender.isSelected
        
        switch statusToxic {
        case false:
            ToxicFumesButton.setImage( UIImage.init(named: "ToxicNormal"), for: .normal)
            print ("false")
            ToxicFumesButton.isSelected = false
            statusToxic = true
            
        case true:
            ToxicFumesButton.setImage( UIImage.init(named: "ToxicActive"), for: .selected)
            print("true")
            ToxicFumesButton.isSelected = true
            statusToxic = false
        }
    }
    
    @IBAction func SpilledWaterButton(_ sender: UIButton) {
        
        var statusWater = !sender.isSelected
        
        switch statusWater {
        case false:
            SpilledWaterButton.setImage( UIImage.init(named: "WaterNormal"), for: .normal)
            print ("false")
            SpilledWaterButton.isSelected = false
            statusWater = true
            
        case true:
            SpilledWaterButton.setImage( UIImage.init(named: "WaterActive"), for: .selected)
            print("true")
            SpilledWaterButton.isSelected = true
            statusWater = false
        }
    }
    
    @IBAction func FireDangerButton(_ sender: UIButton) {
        
        var statusFire = !sender.isSelected
    
        switch statusFire {
        case false:
            FireDangerButton.setImage( UIImage.init(named: "FireDangerNormal"), for: .normal)
            print ("false")
            FireDangerButton.isSelected = false
            statusFire = true
            
        case true:
            FireDangerButton.setImage( UIImage.init(named: "FireDangerActive"), for: .selected)
            print("true")
            FireDangerButton.isSelected = true
            statusFire = false
        }
    }

    @IBOutlet weak var LoudNoiseButton: UIButton!
    @IBOutlet weak var SpilledWasteButton: UIButton!
    @IBOutlet weak var SlipperyFloorButton: UIButton!
    
    @IBAction func LoudNoiseButton(_ sender: UIButton) {
        
        var statusLoudNoise = !sender.isSelected
        
        switch statusLoudNoise {
        case false:
            LoudNoiseButton.setImage( UIImage.init(named: "LoudNoiseNormal"), for: .normal)
            print ("false")
            LoudNoiseButton.isSelected = false
            statusLoudNoise = true
            
        case true:
            LoudNoiseButton.setImage( UIImage.init(named: "LoudNoiseActive"), for: .selected)
            print("true")
            LoudNoiseButton.isSelected = true
            statusLoudNoise = false
        }
    }
    
    @IBAction func SpilledWasteButton(_ sender: UIButton) {
        
        var statusSpilledWaste = !sender.isSelected

        switch statusSpilledWaste {
        case false:
            SpilledWasteButton.setImage( UIImage.init(named: "SpilledWasteNormal"), for: .normal)
            print ("false")
            SpilledWasteButton.isSelected = false
            statusSpilledWaste = true
            
        case true:
            SpilledWasteButton.setImage( UIImage.init(named: "SpilledWasteActive"), for: .selected)
            print("true")
            SpilledWasteButton.isSelected = true
            statusSpilledWaste = false
        }
    }
    
    @IBAction func SlipperyFloorButton(_ sender: UIButton) {
        
        var statusSlipperyFloor = !sender.isSelected
        
        switch statusSlipperyFloor {
        case false:
            SlipperyFloorButton.setImage( UIImage.init(named: "SlipperyFloorNormal"), for: .normal)
            print ("false")
            SlipperyFloorButton.isSelected = false
            statusSlipperyFloor = true
            
        case true:
            SlipperyFloorButton.setImage( UIImage.init(named: "SlipperyFloorActive"), for: .selected)
            print("true")
            SlipperyFloorButton.isSelected = true
            statusSlipperyFloor = false
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        findSelected ()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
