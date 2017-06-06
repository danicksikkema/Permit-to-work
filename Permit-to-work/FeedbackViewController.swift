//
//  FeedbackViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class FeedbackViewController : UIViewController {
    
    let buttonBorderColor = UIColor(red:0.20, green:0.28, blue:0.42, alpha:1.0)
    let buttonBackgroundColor = UIColor(red:0.16, green:0.23, blue:0.33, alpha:0.8)
    let buttonActiveBackgroundColor = UIColor(red:0.24, green:0.34, blue:0.5, alpha:1.0)
    let textviewBorderColor : UIColor = UIColor(red: 0.3725, green: 0.5216, blue: 0.7529, alpha: 1.0)
    
    @IBOutlet weak var riskResultbarView: UIProgressView!
    
    @IBOutlet weak var textViewFeedback: UITextView!
    
    @IBOutlet weak var scoringButton: UIButton!
    @IBOutlet weak var riskButton: UIButton!
    @IBOutlet weak var safetyPrecautionsButton: UIButton!
    @IBOutlet weak var personalSafetyButton: UIButton!
    @IBOutlet weak var environmentSafetyButton: UIButton!
    
    var statusScoringButton = true
    var statusRiskButton = true
    var statusSafetyPrecautionsButton = true
    var statusPersonalSafetyButton = true
    var statusEnvironmentSafetyButton = true
    
    @IBAction func scoringButton(_ sender: UIButton) {
        switch statusScoringButton {
        case false:
            scoringButton.setImage( UIImage.init(named: "ScoringNormal"), for: .normal)
            scoringButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            scoringButton.layer.borderWidth = 1.0
            scoringButton.layer.borderColor = buttonBorderColor.cgColor
            print ("false")
            scoringButton.isSelected = false
            statusScoringButton = true
            
        case true:
            scoringButton.setImage( UIImage.init(named: "ScoringActive"), for: .selected)
            scoringButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            scoringButton.layer.borderWidth = 1.0
            scoringButton.layer.borderColor = textviewBorderColor.cgColor
            print("true")
            scoringButton.isSelected = true
            statusScoringButton = false
        }
    }
    
    @IBAction func riskButton(_ sender: UIButton) {
        let riskFeedback = "Je bent dit risico vergeten"
        
        switch statusRiskButton {
        case false:
            riskButton.setImage( UIImage.init(named: "RiskNormal"), for: .normal)
            riskButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            riskButton.layer.borderWidth = 1.0
            riskButton.layer.borderColor = buttonBorderColor.cgColor
            print ("false")
            riskButton.isSelected = false
            statusRiskButton = true
            
            textViewFeedback.text = ""
            
        case true:
            riskButton.setImage( UIImage.init(named: "RiskActive"), for: .selected)
            riskButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            riskButton.layer.borderWidth = 1.0
            riskButton.layer.borderColor = textviewBorderColor.cgColor
            print("true")
            riskButton.isSelected = true
            statusRiskButton = false
            
            textViewFeedback.text = riskFeedback
        }
    }
    
    @IBAction func safetyPrecautionsButton(_ sender: UIButton) {
        switch statusSafetyPrecautionsButton {
        case false:
            safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyNormal"), for: .normal)
            safetyPrecautionsButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            safetyPrecautionsButton.layer.borderWidth = 1.0
            safetyPrecautionsButton.layer.borderColor = buttonBorderColor.cgColor
            print ("false")
            safetyPrecautionsButton.isSelected = false
            statusSafetyPrecautionsButton = true
            
        case true:
            safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyActive"), for: .selected)
            safetyPrecautionsButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            safetyPrecautionsButton.layer.borderWidth = 1.0
            safetyPrecautionsButton.layer.borderColor = textviewBorderColor.cgColor
            print("true")
            safetyPrecautionsButton.isSelected = true
            statusSafetyPrecautionsButton = false
        }
    }
    
    @IBAction func personalSafetyButton(_ sender: UIButton) {
        switch statusPersonalSafetyButton {
        case false:
            personalSafetyButton.setImage( UIImage.init(named: "PersonalNormal"), for: .normal)
            personalSafetyButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            personalSafetyButton.layer.borderWidth = 1.0
            personalSafetyButton.layer.borderColor = buttonBorderColor.cgColor
            print ("false")
            personalSafetyButton.isSelected = false
            statusPersonalSafetyButton = true
            
        case true:
            personalSafetyButton.setImage( UIImage.init(named: "PersonalActive"), for: .selected)
            personalSafetyButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            personalSafetyButton.layer.borderWidth = 1.0
            personalSafetyButton.layer.borderColor = textviewBorderColor.cgColor
            print("true")
            personalSafetyButton.isSelected = true
            statusPersonalSafetyButton = false
        }
    }
    
    @IBAction func environmentSafetyButton(_ sender: UIButton) {
        switch statusEnvironmentSafetyButton {
        case false:
            environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentNormal"), for: .normal)
            environmentSafetyButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            environmentSafetyButton.layer.borderWidth = 1.0
            environmentSafetyButton.layer.borderColor = buttonBorderColor.cgColor
            print ("false")
            environmentSafetyButton.isSelected = false
            statusRiskButton = true
            
        case true:
            environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentActive"), for: .selected)
            environmentSafetyButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            environmentSafetyButton.layer.borderWidth = 1.0
            environmentSafetyButton.layer.borderColor = textviewBorderColor.cgColor
            print("true")
            environmentSafetyButton.isSelected = true
            statusEnvironmentSafetyButton = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        riskResultbarView.progress = 0.5
        
        scoringButton.layer.backgroundColor = buttonBackgroundColor.cgColor
        scoringButton.setImage( UIImage.init(named: "ScoringActive"), for: .normal)
        riskButton.setImage( UIImage.init(named: "RiskNormal"), for: .normal)
        safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyNormal"), for: .normal)
        personalSafetyButton.setImage( UIImage.init(named: "PersonalNormal"), for: .normal)
        environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentNormal"), for: .normal)
        
        // Setting UIButton styling
        let buttons = [scoringButton, riskButton, safetyPrecautionsButton, personalSafetyButton, environmentSafetyButton]
        
        for button in buttons {
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = buttonBorderColor.cgColor
            button?.layer.backgroundColor = buttonBackgroundColor.cgColor
        }
        
        let borderTop = CAShapeLayer()
        borderTop.bounds = scoringButton.frame
        borderTop.position = scoringButton.center
        borderTop.path = UIBezierPath(roundedRect: scoringButton.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        // Masking the textview layer with borderTop layer
        scoringButton.layer.mask = borderTop
        
        let borderBottom = CAShapeLayer()
        borderBottom.bounds = environmentSafetyButton.frame
        borderBottom.position = environmentSafetyButton.center
        borderBottom.path = UIBezierPath(roundedRect: environmentSafetyButton.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: 8, height: 8)).cgPath
        
        // Masking the textview layer with borderBottom layer
        environmentSafetyButton.layer.mask = borderBottom
        
        // Setting textView styling
        textViewFeedback.layer.cornerRadius = 8
        textViewFeedback.layer.borderWidth = 1.0
        textViewFeedback.layer.borderColor = textviewBorderColor.cgColor
        textViewFeedback.isUserInteractionEnabled = false
    }
}
