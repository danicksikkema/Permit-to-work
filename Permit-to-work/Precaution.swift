//
//  Precaution.swift
//  Permit-to-work
//
//  Created by danick sikkema on 03-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

struct Precaution {
    var precautionId    : Int = 0
    var precautionName  : String = ""
    
    init (precautionId: Int, precautionName: String) {
        self.precautionId = precautionId
        self.precautionName = precautionName
    }
}




