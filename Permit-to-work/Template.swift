//
//  Template.swift
//  Permit-to-work
//
//  Created by danick sikkema on 03-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire

class TemplateStep {
    var stepDescription : String?
    var stepDanger : String?
    
    init(stepDescription: String, stepDanger: String) {
        self.stepDescription = stepDescription
        self.stepDanger = stepDanger
    }
}

class Template {
    var templateName : String?
    var templateType : Int?
    var templateStep : TemplateStep?
    
    init (templateName: String, templateType: Int, templateStep : TemplateStep? = nil) {
        self.templateName = templateName
        self.templateType = templateType
        self.templateStep = templateStep
    }
}

class TemplateSteps {
    var allTemplateSteps : [TemplateStep] = []
    
    static let instance : TemplateSteps = TemplateSteps()
    
    private init() {
        
    }
}
