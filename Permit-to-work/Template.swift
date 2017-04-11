//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

class Step {
    var task : String = ""
    var danger : String = ""
    
    init(task: String, danger: String) {
        self.task = task
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
    
    static let instantie : Templates = Templates()
    
    private init() {
        allTemplates = [
            Template(name: "template 1", templateStep: Step (task: "task 1", danger: "danger 1"))
        ]
    }

}
