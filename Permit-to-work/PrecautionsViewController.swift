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
        
        var statusButton1 = !sender.isSelected
        
        switch statusButton1 {
        case false:
            button1.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button1.isSelected = false
            statusButton1 = true
            
        case true:
            button1.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button1.isSelected = true
            statusButton1 = false
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        
        var statusButton2 = !sender.isSelected
        
        switch statusButton2 {
        case false:
            button2.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button2.isSelected = false
            statusButton2 = true
            
        case true:
            button2.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button2.isSelected = true
            statusButton2 = false
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        
        var statusButton3 = !sender.isSelected
        
        switch statusButton3 {
        case false:
            button3.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button3.isSelected = false
            statusButton3 = true
            
        case true:
            button3.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button3.isSelected = true
            statusButton3 = false
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        
        var statusButton4 = !sender.isSelected
        
        switch statusButton4 {
        case false:
            button4.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button4.isSelected = false
            statusButton4 = true
            
        case true:
            button4.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button4.isSelected = true
            statusButton4 = false
        }
    }
    
    // row 2
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBAction func button5(_ sender: UIButton) {
        
        var statusButton5 = !sender.isSelected
        
        switch statusButton5 {
        case false:
            button5.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button5.isSelected = false
            statusButton5 = true
            
        case true:
            button5.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button5.isSelected = true
            statusButton5 = false
        }
    }
    
    @IBAction func button6(_ sender: UIButton) {
        
        var statusButton6 = !sender.isSelected
        
        switch statusButton6 {
        case false:
            button6.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button6.isSelected = false
            statusButton6 = true
            
        case true:
            button6.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button6.isSelected = true
            statusButton6 = false
        }
    }
    
    @IBAction func button7(_ sender: UIButton) {
        
        var statusButton7 = !sender.isSelected
        
        switch statusButton7 {
        case false:
            button7.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button7.isSelected = false
            statusButton7 = true
            
        case true:
            button7.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button7.isSelected = true
            statusButton7 = false
        }
    }
    
    @IBAction func button8(_ sender: UIButton) {
        
        var statusButton8 = !sender.isSelected
        
        switch statusButton8 {
        case false:
            button8.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button8.isSelected = false
            statusButton8 = true
            
        case true:
            button8.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button8.isSelected = true
            statusButton8 = false
        }
    }
    
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBAction func button9(_ sender: UIButton) {
        
        var statusButton9 = !sender.isSelected
        
        switch statusButton9 {
        case false:
            button9.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button9.isSelected = false
            statusButton9 = true
            
        case true:
            button9.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button9.isSelected = true
            statusButton9 = false
        }
    }
    
    @IBAction func button10(_ sender: UIButton) {
        
        var statusButton10 = !sender.isSelected
        
        switch statusButton10 {
        case false:
            button10.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button10.isSelected = false
            statusButton10 = true
            
        case true:
            button10.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button10.isSelected = true
            statusButton10 = false
        }
    }
    
    @IBAction func button11(_ sender: UIButton) {
        
        var statusButton11 = !sender.isSelected
        
        switch statusButton11 {
        case false:
            button11.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button11.isSelected = false
            statusButton11 = true
            
        case true:
            button11.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button11.isSelected = true
            statusButton11 = false
        }
    }
    
    @IBAction func button12(_ sender: UIButton) {
        
        var statusButton12 = !sender.isSelected
        
        switch statusButton12 {
        case false:
            button12.setBackgroundImage(UIImage.init(named: "PrecautionNormal"), for: .normal)
            print ("false")
            button12.isSelected = false
            statusButton12 = true
            
        case true:
            button12.setBackgroundImage( UIImage.init(named: "PrecautionActive"), for: .selected)
            print("true")
            button12.isSelected = true
            statusButton12 = false
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
