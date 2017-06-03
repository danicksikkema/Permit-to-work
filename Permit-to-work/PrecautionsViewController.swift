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
    
    @IBOutlet weak var button1: UIButton!
    
    var statusButton1 = true
    
    @IBAction func button1(_ sender: UIButton) {
        
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
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        findSelected()
    }
    
    func findSelected () {
        if button1.isSelected == true {
            let parameters: [String: String] = ["feedback": (button1.titleLabel?.text!)!]
            
            print(parameters)
            
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
            button1.isSelected = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
