//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

class PermitStep {
    var stepDescription : String = ""
    var stepDanger : String = ""
    
    init(stepDescription: String, stepDanger: String) {
        self.stepDescription = stepDescription 
        self.stepDanger = stepDanger 
    }
}

class PermitSteps {
    var allPermitSteps : [PermitStep] = []
    
    static let instance : PermitSteps = PermitSteps()
    
    private init() {
        // Voorbeeld
//        allPermitSteps = [PermitStep(stepDescription: "description", stepDanger: "danger")]
    }
    
    func addNewPermitStep (permitStep : PermitStep) {
        allPermitSteps.append (permitStep)
    }
    
    // Need to fix this
    func compareArray () {
        for step in allPermitSteps {
            if step.stepDescription == "description2" {
                print ("true")
            } else {
                print ("false")
            }
        }
    }
}
