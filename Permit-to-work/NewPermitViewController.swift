//
//  NewPermitViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NewPermitViewController : UIViewController, UITextFieldDelegate, UITextViewDelegate {
    var permits = Permits.instance
    var templates = Templates.instance
    
    @IBOutlet weak var textFieldTime: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldStep: UITextField!
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldDescription: UITextView!
    
    // If datePicker changes update textfield
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        textFieldDate.text = dateFormatter.string(from: sender.date)
    }
        
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func helpButton(_ sender: Any) {
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let name = textfieldName.text
        let type = textFieldType.text
        let description = textFieldDescription.text
        
//            if (name?.isEmpty)! || (type?.isEmpty)! || (description?.isEmpty)! {
//                
//                let alertController = UIAlertController(title: "Missing input", message: "Alle velden moeten ingevuld worden", preferredStyle: .alert)
//                
//                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alertController.addAction(defaultAction)
//                
//                present(alertController, animated: true, completion: nil)
//            } else {
//                let newPermitParameters: [String : Any] = ["permitId": 0, "permitName": textfieldName.text!, "type": textFieldType.text!, "workDescription": textFieldDescription.text!]
//                
//                print(newPermitParameters)
//                
//                Alamofire.request("http://avhx.com/api/v1/permits", method: .post, parameters: newPermitParameters, encoding: JSONEncoding.default).responseString { response in
//                    
//                    if response.result.value != nil {
//                        print(response)
//                        print(response.result)
//                        print(response.result.isSuccess)
//                    } else {
//                        print("error")
//                    }
//                }
//                
//                let newPermit = Permit (fromJSON: newPermitParameters)
//                
//                let permits = Permits.instance
//                permits.addNewPermit(permit: newPermit)
//        
//                // Empty textfields
//                self.textfieldName.text = ""
//                self.textFieldType.text = ""
//
//                performSegue(withIdentifier: "goToProtection", sender: sender)
//            }
        performSegue(withIdentifier: "goToProtection", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting the Delegates for the TextFields
        textfieldName.delegate = self
        textFieldType.delegate = self
        textFieldDescription.delegate = self
        textFieldDate.delegate = self
        textFieldTime.delegate = self
        
        // Set current day as a standard.
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateStyle = DateFormatter.Style.medium
        let result = formatter.string(from: date)
        
        textFieldDate.text = result
        
        // Use datepicker instead of keyboard for textFieldDate
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        textFieldDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewPermitViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)

        // Setting TextField styling
        let myColor : UIColor = UIColor(red: 0.3725, green: 0.5216, blue: 0.7529, alpha: 1.0)
        
        textfieldName.layer.borderWidth = 1.0
        textfieldName.layer.borderColor = myColor.cgColor
        textfieldName.layer.cornerRadius = 8;
        textfieldName.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        textFieldType.layer.borderWidth = 1.0
        textFieldType.layer.borderColor = myColor.cgColor
        textFieldType.layer.cornerRadius = 8;
        textFieldType.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        textFieldDescription.layer.borderWidth = 1.0
        textFieldDescription.layer.borderColor = myColor.cgColor
        textFieldDescription.layer.cornerRadius = 8;
        textFieldDescription.layer.sublayerTransform = CATransform3DMakeTranslation(20, 20, 0)
        
        textFieldDate.layer.borderWidth = 1.0
        textFieldDate.layer.borderColor = myColor.cgColor
        textFieldDate.layer.cornerRadius = 8;
        textFieldDate.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)

        textFieldStep.layer.borderWidth = 1.0
        textFieldStep.layer.borderColor = myColor.cgColor
        textFieldStep.layer.cornerRadius = 8;

        textFieldTime.layer.borderWidth = 1.0
        textFieldTime.layer.borderColor = myColor.cgColor
        textFieldTime.layer.cornerRadius = 8;
        textFieldTime.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)

        textFieldDescription.text = "Type your work description"
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Type your work description" {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type your work description"
        }
    }
}
