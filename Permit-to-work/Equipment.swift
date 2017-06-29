//
//  Equipment.swift
//  Permit-to-work
//
//  Created by Danick on 05-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

struct Equipment {
    var equipmentId            : Int = 0
    var equipmentName          : String = ""
    
    init (equipmentId: Int, equipmentName: String) {
        self.equipmentId = equipmentId
        self.equipmentName = equipmentName
    }
}

