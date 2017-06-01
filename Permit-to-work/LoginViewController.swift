//
//  LoginViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 04-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        
        present(mainNavigationController, animated: true, completion: nil)
    }
}
