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

class PrecautionFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    var score               : Int = 0
    
    init (id: Int, feedback: String, score: Int) {
        self.id = id
        self.feedback = feedback
        self.score = score
    }
    
    init (fromJSON: Any) {
        // 4: Als er een array is dan wordt dit opgesagen als een dictionary met [String : Any]
        if let precautionFeedbackAsDictionary = fromJSON as? [String: Any] {
            self.id = precautionFeedbackAsDictionary ["precautionsId"] as! Int
            self.feedback = precautionFeedbackAsDictionary ["feedback"] as! String
            self.score = precautionFeedbackAsDictionary ["score"] as! Int
        }
    }
}

class PrecautionsFeedback {
    var allPrecautionsFeedback : [PrecautionFeedback] = []
    
    static let instance : PrecautionsFeedback = PrecautionsFeedback()
    
    private init() {
        
    }
    
    // 1: If json data is picked up from server, save it in json variable.
    func getPrecautionsFeedbackFromServer () {
        Alamofire.request("http://avhx.com/api/v1/precautionfb").responseJSON { response in
            
            if let json = response.result.value {
                self.getPrecautionsFeedbackFromJSON (json: json)
                print (json)
            }
        }
    }
    
    //     2: Als het lukt om hieruit een array op te halen, dan wordt dit in de variable klanten opgeslagen.
    func getPrecautionsFeedbackFromJSON (json: Any) {
        if let precautionsFeedback = json as? [Any] {
            
            // 3: Loop door de array van permits en haal ze er uit en sla op als dictionary in variable newPermit.
            for precautionFeedback in precautionsFeedback {
                let newPrecautionFeedback = PrecautionFeedback (fromJSON: precautionFeedback)
                
                // 5: Voeg aan de lijst met klanten, nieuwe permit toe.
                allPrecautionsFeedback.append(newPrecautionFeedback)
            }
        } else {
            print ("error")
        }
    }
}

class EnvironmentFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    var score               : Int = 0
    
    init (id: Int, feedback: String, score: Int) {
        self.id = id
        self.feedback = feedback
        self.score = score
    }
    
    init (fromJSON: Any) {
        // 4: Als er een array is dan wordt dit opgesagen als een dictionary met [String : Any]
        if let environmentFeedbackAsDictionary = fromJSON as? [String: Any] {
            self.id = environmentFeedbackAsDictionary ["environmentId"] as! Int
            self.feedback = environmentFeedbackAsDictionary ["feedback"] as! String
            self.score = environmentFeedbackAsDictionary ["score"] as! Int
        }
    }
}

class EnvironmentsFeedback {
    var allEnvironmentsFeedback : [EnvironmentFeedback] = []
    
    static let instance : EnvironmentsFeedback = EnvironmentsFeedback()
    
    private init() {
        
    }
    
    // 1: If json data is picked up from server, save it in json variable.
    func getEnvironmentsFeedbackFromServer () {
        Alamofire.request("http://avhx.com/api/v1/environmentfb").responseJSON { response in
            
            if let json = response.result.value {
                self.getEnvironmentsFeedbackFromJSON (json: json)
                print (json)
            }
        }
    }
    
    //     2: Als het lukt om hieruit een array op te halen, dan wordt dit in de variable klanten opgeslagen.
    func getEnvironmentsFeedbackFromJSON (json: Any) {
        if let environmentsFeedback = json as? [Any] {
            
            // 3: Loop door de array van permits en haal ze er uit en sla op als dictionary in variable newPermit.
            for environmentFeedback in environmentsFeedback {
                let newEnvironmentFeedback = EnvironmentFeedback (fromJSON: environmentFeedback)
                
                // 5: Voeg aan de lijst met klanten, nieuwe permit toe.
                allEnvironmentsFeedback.append(newEnvironmentFeedback)
            }
        } else {
            print ("error")
        }
    }
}

class PersonalFeedback {
    var id                  : Int = 0
    var feedback            : String = ""
    var score               : Int = 0
    
    init (id: Int, feedback: String, score: Int) {
        self.id = id
        self.feedback = feedback
        self.score = score
    }
    
    init (fromJSON: Any) {
        // 4: Als er een array is dan wordt dit opgesagen als een dictionary met [String : Any]
        if let personalFeedbackAsDictionary = fromJSON as? [String: Any] {
            self.id = personalFeedbackAsDictionary ["protectionId"] as! Int
            self.feedback = personalFeedbackAsDictionary ["feedback"] as! String
            self.score = personalFeedbackAsDictionary ["score"] as! Int
        }
    }
}

class PersonalsFeedback {
    var allPersonalsFeedback : [PersonalFeedback] = []
    
    static let instance : PersonalsFeedback = PersonalsFeedback()
    
    private init() {
        
    }
    
    // 1: If json data is picked up from server, save it in json variable.
    func getPersonalsFeedbackFromServer () {
        Alamofire.request("http://avhx.com/api/v1/protectionfb").responseJSON { response in
            
            if let json = response.result.value {
                self.getPersonalsFeedbackFromJSON (json: json)
                print (json)
            }
        }
    }
    
    //     2: Als het lukt om hieruit een array op te halen, dan wordt dit in de variable klanten opgeslagen.
    func getPersonalsFeedbackFromJSON (json: Any) {
        if let personalsFeedback = json as? [Any] {
            
            // 3: Loop door de array van permits en haal ze er uit en sla op als dictionary in variable newPermit.
            for personalFeedback in personalsFeedback {
                let newPersonalFeedback = PersonalFeedback (fromJSON: personalFeedback)
                
                // 5: Voeg aan de lijst met klanten, nieuwe permit toe.
                allPersonalsFeedback.append(newPersonalFeedback)
            }
        } else {
            print ("error")
        }
    }
}
