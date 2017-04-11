//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

class Step {
    var stepDescription : String = ""
    var danger : String = ""
    
    init(stepDescription: String, danger: String) {
        self.stepDescription = stepDescription
        self.danger = danger
    }
}

class Template {
    var name : String = ""
    var templateStep: Step?

    init(name: String, templateStep : Step? = nil) {
        self.name = name
        self.templateStep = templateStep
    }
}

class Templates {
    var allTemplates : [Template]
    
    static let instance : Templates = Templates()
    
    private init() {
        allTemplates = [
            Template(name: "template 1", templateStep: Step (stepDescription: "description 1", danger: "danger 1"))
        ]
    }

}
