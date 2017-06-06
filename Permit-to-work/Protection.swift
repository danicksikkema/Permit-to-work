//
//  Protection.swift
//  Permit-to-work
//
//  Created by Danick on 05-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire

class Protection {
    var protectionId            : Int = 0
    var protectionName          : String = ""
    
    init (protectionId: Int, protectionName: String) {
        self.protectionId = protectionId
        self.protectionName = protectionName
    }
}

