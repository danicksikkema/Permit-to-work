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
    @IBOutlet weak var safetyPrecautionsButton: UIButton!
    @IBOutlet weak var personalSafetyButton: UIButton!
    @IBOutlet weak var environmentSafetyButton: UIButton!
    
    @IBAction func scoringButton(_ sender: UIButton) {
    
        sender.isSelected = !sender.isSelected
    
        switch sender.isSelected {
        case false:
            scoringButton.setImage( UIImage.init(named: "ScoringNormal"), for: .normal)
            scoringButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            scoringButton.layer.borderWidth = 1.0
            scoringButton.layer.borderColor = buttonBorderColor.cgColor
            
            riskResultbarView.isHidden = true
            
        case true:
            scoringButton.setImage( UIImage.init(named: "ScoringActive"), for: .selected)
            scoringButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            scoringButton.layer.borderWidth = 1.0
            scoringButton.layer.borderColor = textviewBorderColor.cgColor
            
            riskResultbarView.isHidden = false
        }
    }
    
    @IBAction func safetyPrecautionsButton(_ sender: UIButton) {
        
        let precautionsFeedback = PrecautionsFeedback.instance
        
        let precautionFeedback = precautionsFeedback.allPrecautionsFeedback
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
        case false:
            safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyNormal"), for: .normal)
            safetyPrecautionsButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            safetyPrecautionsButton.layer.borderWidth = 1.0
            safetyPrecautionsButton.layer.borderColor = buttonBorderColor.cgColor
            
            textViewFeedback.text = ""

            
        case true:
            safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyActive"), for: .selected)
            safetyPrecautionsButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            safetyPrecautionsButton.layer.borderWidth = 1.0
            safetyPrecautionsButton.layer.borderColor = textviewBorderColor.cgColor
            
            let total = precautionsFeedback.allPrecautionsFeedback.count - 1
            
            for index in 0...total {
                textViewFeedback.text.append(precautionFeedback[index].feedback)
            }
        }
    }
    
    @IBAction func personalSafetyButton(_ sender: UIButton) {
        
        let personalsFeedback = PersonalsFeedback.instance
        
        let personalFeedback = personalsFeedback.allPersonalsFeedback
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
        case false:
            personalSafetyButton.setImage( UIImage.init(named: "PersonalNormal"), for: .normal)
            personalSafetyButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            personalSafetyButton.layer.borderWidth = 1.0
            personalSafetyButton.layer.borderColor = buttonBorderColor.cgColor
            
            textViewFeedback.text = ""
            
        case true:
            personalSafetyButton.setImage( UIImage.init(named: "PersonalActive"), for: .selected)
            personalSafetyButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            personalSafetyButton.layer.borderWidth = 1.0
            personalSafetyButton.layer.borderColor = textviewBorderColor.cgColor
            
            let total = personalsFeedback.allPersonalsFeedback.count - 1
            
            for index in 0...total {
                textViewFeedback.text.append(personalFeedback[index].feedback)
            }
        }
    }
    
    @IBAction func environmentSafetyButton(_ sender: UIButton) {
        
        let environmentsFeedback = EnvironmentsFeedback.instance
        
        let environmentFeedback = environmentsFeedback.allEnvironmentsFeedback
        
        sender.isSelected = !sender.isSelected
        
        switch sender.isSelected {
        case false:
            environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentNormal"), for: .normal)
            environmentSafetyButton.layer.backgroundColor = buttonBackgroundColor.cgColor
            environmentSafetyButton.layer.borderWidth = 1.0
            environmentSafetyButton.layer.borderColor = buttonBorderColor.cgColor
            
            textViewFeedback.text = ""
            
        case true:
            environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentActive"), for: .selected)
            environmentSafetyButton.layer.backgroundColor = buttonActiveBackgroundColor.cgColor
            environmentSafetyButton.layer.borderWidth = 1.0
            environmentSafetyButton.layer.borderColor = textviewBorderColor.cgColor
            
            let total = environmentsFeedback.allEnvironmentsFeedback.count - 1
            
            for index in 0...total {
                textViewFeedback.text.append(environmentFeedback[index].feedback)
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        riskResultbarView.isHidden = true
        
        riskResultbarView.progress = 0.5
        scoringButton.layer.backgroundColor = buttonBackgroundColor.cgColor
        scoringButton.setImage( UIImage.init(named: "ScoringActive"), for: .normal)
        safetyPrecautionsButton.setImage( UIImage.init(named: "SafetyNormal"), for: .normal)
        personalSafetyButton.setImage( UIImage.init(named: "PersonalNormal"), for: .normal)
        environmentSafetyButton.setImage( UIImage.init(named: "EnvironmentNormal"), for: .normal)
        
        // Setting UIButton styling
        let buttons = [scoringButton, safetyPrecautionsButton, personalSafetyButton, environmentSafetyButton]
        
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
