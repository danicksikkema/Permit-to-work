//
//  Feedback.swift
//  Permit-to-work
//
//  Created by Danick on 06-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RiskFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    
    init (id: Int, feedback: String) {
        self.id = id
        self.feedback = feedback
    }
    
    init (fromJSON: Any) {
        // 4: Als er een array is dan wordt dit opgesagen als een dictionary met [String : Any]
        if let riskFeedbackAsDictionary = fromJSON as? [String: Any] {
            self.id = riskFeedbackAsDictionary ["protectionId"] as! Int
            self.feedback = riskFeedbackAsDictionary ["feedback"] as! String
        }
    }
}

class RisksFeedback {
    var allRisksFeedback : [RiskFeedback] = []
    
    static let instance : RisksFeedback = RisksFeedback()
    
    private init() {
        
    }
    
    // 1: If json data is picked up from server, save it in json variable.
    func getRisksFeedbackFromServer () {
        Alamofire.request("http://avhx.com/api/v1/protectionfb").responseJSON { response in
            
            if let json = response.result.value {
                self.getRisksFeedbackFromJSON (json: json)
                print (json)
            }
        }
    }
    
    //     2: Als het lukt om hieruit een array op te halen, dan wordt dit in de variable klanten opgeslagen.
    func getRisksFeedbackFromJSON (json: Any) {
        if let risksFeedback = json as? [Any] {
            
            // 3: Loop door de array van permits en haal ze er uit en sla op als dictionary in variable newPermit.
            for riskFeedback in risksFeedback {
                let newRiskFeedback = RiskFeedback (fromJSON: riskFeedback)
                
                // 5: Voeg aan de lijst met klanten, nieuwe permit toe.
                allRisksFeedback.append(newRiskFeedback)
            }
        } else {
            print ("error")
        }
    }
}

class EnvirionmentFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    
    init (id: Int, feedback: String) {
        self.id = id
        self.feedback = feedback
    }
}

class PersonalFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    
    init (id: Int, feedback: String) {
        self.id = id
        self.feedback = feedback
    }
}

class SafetyFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    
    init (id: Int, feedback: String) {
        self.id = id
        self.feedback = feedback
    }
}
