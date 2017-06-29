//
//  Envirionment.swift
//  Permit-to-work
//
//  Created by Danick on 05-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

struct Envirionment {
    var envirionmentId            : Int = 0
    var envirionmentName          : String = ""
    
    init (envirionmentId: Int, envirionmentName: String) {
        self.envirionmentId = envirionmentId
        self.envirionmentName = envirionmentName
    }
}

