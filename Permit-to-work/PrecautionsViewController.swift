//
//  PrecautionsViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PrecautionsViewController : UIViewController {
    
    // row 1
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func button1(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button1.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button1.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button2.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button2.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button3.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button3.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button4.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button4.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    // row 2
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBAction func button5(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button5.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button5.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button6(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button6.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button6.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button7(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button7.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button7.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button8(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button8.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button8.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBAction func button9(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button9.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button9.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button10(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button10.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button10.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button11(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button11.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button11.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func button12(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
            case false:
                button12.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            
            case true:
                button12.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        findSelection()
    }
    
    func findSelection () {
        let buttons: [UIButton] = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12]
    
        for button in buttons {
            if button.isSelected == true {
                let parameters = ["name": (button.titleLabel?.text!)!]
                
                Alamofire.request("http://avhx.com/api/v1/precautions", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                    
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
