//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire

class PermitStep {
    var stepDescription : String?
    var stepDanger : String?
    
    init(stepDescription: String, stepDanger: String) {
        self.stepDescription = stepDescription
        self.stepDanger = stepDanger
    }
}

class Permit {
    var permitName : String?
    var permitType : Int?
    var permitStep : PermitStep?
    
    init (permitName: String, permitType: Int, permitStep : PermitStep? = nil) {
        self.permitName = permitName
        self.permitType = permitType
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



