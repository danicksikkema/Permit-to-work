//
//  PermitSteps.swift
//  Permit-to-work
//
//  Created by danick sikkema on 17-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PermitStep {
    var stepDescription : String?
    var stepDanger : String?
    
    init(stepDescription: String, stepDanger: String) {
        self.stepDescription = stepDescription
        self.stepDanger = stepDanger
    }
}

class PermitSteps {
    var allPermitSteps : [PermitStep] = []
    
    static let instance : PermitSteps = PermitSteps()
    
    private init() {
        
    }
    
    func addNewPermitStep (permitStep : PermitStep) {
        allPermitSteps.append (permitStep)
    }
}

// PermitSteps validations

protocol AnswerPermitStepValidator {
    func validateDescription (description: String) -> [String]
    func validateDanger (danger: String) -> [String]
}










