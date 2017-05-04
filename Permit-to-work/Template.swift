//
//  Template.swift
//  Permit-to-work
//
//  Created by danick sikkema on 03-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire

class Template {
    var templateName : String?
    var templateType : Int?
    
    init (templateName: String, templateType: Int) {
        self.templateName = templateName
        self.templateType = templateType
    }
}
