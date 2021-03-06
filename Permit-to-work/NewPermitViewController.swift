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

class NewPermitViewController : UIViewController, UITextFieldDelegate, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    var permits = Permits.instance
    
    @IBOutlet weak var textFieldTime: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldStep: UITextField!
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldDescription: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let permitTypes = ["Hot Work", "Cold Work", "Enclosed Spaces"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        return NSAttributedString(string: "\(permitTypes[row])", attributes: [NSForegroundColorAttributeName:UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return permitTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldType.text = permitTypes[row]
        pickerView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == textFieldType) {
            pickerView.isHidden = false
            
            textField.endEditing(true)
        } else {
            pickerView.isHidden = true
        }
    }
    
    // If datePicker changes update textfield
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        textFieldDate.text = dateFormatter.string(from: sender.date)
    }
    
    func closekeyboard() {
        self.view.endEditing(true)
        pickerView.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    @IBAction func helpButton(_ sender: Any) {

    }
    
    // Empty textfields
    func clearTextFields () {
        self.textfieldName.text = ""
        self.textFieldType.text = ""
    }
    
    // Saving data
    func savePermitData () {
        let newPermitParameters: [String : Any] = ["permitName": textfieldName.text!, "type": textFieldType.text!, "workDescription": textFieldDescription.text!]
        
        Alamofire.request("http://avhx.com/api/v1/permits", method: .post, parameters: newPermitParameters, encoding: JSONEncoding.default).responseString { response in
            
            if response.result.value != nil {
                debugPrint(response)
                print(response.result)
                print(response.result.isSuccess)
            } else {
                print("error")
            }
        }
        
        let newPermit = Permit (id: 0, permitName: textfieldName.text!, permitType: textFieldType.text!, permitDescription: textFieldDescription.text!)
        
        let permits = Permits.instance
        permits.addNewPermit(permit: newPermit)
    }
    
    // Create permit
    func createPermit () {
        let status = ConnectionCheck().connectionStatus()
        
        switch status {
        case .unknown, .offline:
            print("Not connected")
            
            let alertController = UIAlertController(title: "No Internet connection", message: "Er is geen internet conncectie, maak opnieuw verbinding om door te gaan.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        case .online(.wwan):
            savePermitData ()
            clearTextFields ()

        case .online(.wiFi):
            savePermitData ()
            clearTextFields ()
        }
    }
    
    // Next button to protection page
    @IBAction func nextButton(_ sender: Any) {
//        let name = textfieldName.text
//        let type = textFieldType.text
//        let description = textFieldDescription.text
//        
//            if (name?.isEmpty)! || (type?.isEmpty)! || (description?.isEmpty)! {
//                
//                let alertController = UIAlertController(title: "Missing input", message: "Alle velden moeten ingevuld worden", preferredStyle: .alert)
//                
//                let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alertController.addAction(defaultAction)
//                
//                present(alertController, animated: true, completion: nil)
//            } else {
//                createPermit ()
//                performSegue(withIdentifier: "goToProtection", sender: sender)
//            }
        
        performSegue(withIdentifier: "goToProtection", sender: sender)
    }
    
    func displayDate() {
        // Set current day as a standard.
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateStyle = DateFormatter.Style.medium
        let dateResult = formatter.string(from: date)
        
        textFieldDate.text = dateResult
    }
    
    func displayTime() {
        // Set current time as standard.
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let timeResult = ("\(hour):\(minutes):\(seconds)")
        
        textFieldTime.text = timeResult
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor : UIColor = UIColor(red: 0.3725, green: 0.5216, blue: 0.7529, alpha: 1.0)
        
        // Hide pickerView
        pickerView.isHidden = true
        pickerView.layer.cornerRadius = 8
        pickerView.layer.borderWidth = 1.0
        pickerView.layer.borderColor = myColor.cgColor
        
        // Set default value of permitTypes
        textFieldType.text = permitTypes[0]
        
        //Setting the Delegates for the TextFields
        textfieldName.delegate = self
        textFieldType.delegate = self
        textFieldDescription.delegate = self
        textFieldDate.delegate = self
        textFieldTime.delegate = self
        
        displayDate()
        displayTime()
        
        // Disable textFieldStep
        textFieldStep.isUserInteractionEnabled = false
        
        // Use datepicker instead of keyboard for textFieldDate
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        textFieldDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewPermitViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)

        // Setting TextField styling
        textfieldName.layer.borderWidth = 1.0
        textfieldName.layer.borderColor = myColor.cgColor
        textfieldName.layer.cornerRadius = 8
        textfieldName.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        textFieldType.layer.borderWidth = 1.0
        textFieldType.layer.borderColor = myColor.cgColor
        textFieldType.layer.cornerRadius = 8
        textFieldType.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        textFieldDescription.layer.borderWidth = 1.0
        textFieldDescription.layer.borderColor = myColor.cgColor
        textFieldDescription.layer.cornerRadius = 8
        textFieldDescription.layer.sublayerTransform = CATransform3DMakeTranslation(20, 20, 0)
        
        textFieldDate.layer.borderWidth = 1.0
        textFieldDate.layer.borderColor = myColor.cgColor
        textFieldDate.layer.cornerRadius = 8
        textFieldDate.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)

        textFieldStep.layer.borderWidth = 1.0
        textFieldStep.layer.borderColor = myColor.cgColor
        textFieldStep.layer.cornerRadius = 8

        textFieldTime.layer.borderWidth = 1.0
        textFieldTime.layer.borderColor = myColor.cgColor
        textFieldTime.layer.cornerRadius = 8
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
