//
//  Permit.swift
//  Permit-to-work
//
//  Created by danick sikkema on 10-04-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Permit {
    var permitId   : Int = 0
    var permitName : String = ""
    var permitType : Int = 0
    var permitTool : String = ""
    var permitStep : PermitStep?
    
    init (permitId: Int, permitName: String, permitType: Int, permitTool: String, permitStep : PermitStep? = nil) {
        self.permitId = permitId
        self.permitName = permitName
        self.permitType = permitType
        self.permitTool = permitTool
        self.permitStep = permitStep
    }
    
    // MELDING: json kan fout zijn, foutmeldingen afhandelen en wat als er een andere waarde is.
    init (fromJSON: Any) {
        // 4: Als er een array is dan wordt dit opgesagen als een dictionary met [String : Any]
        if let permitAsDictionary = fromJSON as? [String: Any] {
            
            self.permitId = permitAsDictionary ["permitId"] as! Int
            self.permitName = permitAsDictionary ["permitName"] as! String
            self.permitType = permitAsDictionary ["type"] as! Int
            self.permitTool = permitAsDictionary ["tools"] as! String
            self.permitStep = permitAsDictionary ["steps"] as? PermitStep
        }
    }
}

class Permits {
    var allPermits : [Permit] = []
    
    static let instance : Permits = Permits()
    
    private init() {
    
    }
    
    func addNewPermit (permit : Permit) {
        allPermits.append (permit)
    }
    
    // 1: If json data is picked up from server, save it in json variable.
    func getPermitsFromServer () {
        Alamofire.request("http://avhx.com/api/v1/permits").responseJSON { response in
            
            if let json = response.result.value {
                
                print(json)
                self.getPermitsFromJSON (json: json)

            }
        }
    }

//     2: Als het lukt om hieruit een array op te halen, dan wordt dit in de variable klanten opgeslagen.
    func getPermitsFromJSON (json: Any) {
        if let permits = json as? [Any] {
            print ("Er zijn \(permits.count) permits")
            
            // 3: Loop door de array van permits en haal ze er uit en sla op als dictionary in variable newPermit.
            for permitAsJSON in permits {
                let newPermit = Permit (fromJSON: permitAsJSON)

                // 5: Voeg aan de lijst met klanten, nieuwe klant toe.
                allPermits.append(newPermit)
            }

            // 6: Wordt gekoppeld aan de table view en stuurt een sender als er nieuwe klanten zijn.
            NotificationCenter.default.post(name: Notification.Name("NewPermits"), object: nil)
        }
    }
}

// Permit validations
protocol AnswerPermitValidator {
    func validatePermit (answer: String) -> [String]
}

class AnswerAlwaysRight : AnswerPermitValidator  {
    func validatePermit(answer: String) -> [String] {
        if answer.isEmpty {
            return ["Geef de permit een naam."]
        } else {
            return ["De naam is ..."]
        }
    }
}

//PermitTemplate[0].question
