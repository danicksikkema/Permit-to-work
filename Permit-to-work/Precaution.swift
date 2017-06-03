//
//  Precaution.swift
//  Permit-to-work
//
//  Created by danick sikkema on 03-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation

class Precaution {
    var precautionName  : String = ""
    
    init (precautionName: String) {
        self.precautionName = precautionName
    }
}

class Precautions {
    var allPrecautions : [Precaution] = []
    
    static let instance : Precautions = Precautions()
    
    private init() {
        
    }
    
    func addNewPrecaution (precaution : Precaution) {
        allPrecautions.append (precaution)
    }
}
