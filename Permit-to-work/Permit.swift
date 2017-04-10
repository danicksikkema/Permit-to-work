//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation


class Permit {
    
    var naam : String = ""
    var task : [String] = [""]
    
    init(naam: String, task: [String] = []) {
        self.naam = naam
        self.task = task
    }
}
