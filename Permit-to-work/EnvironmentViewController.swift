//
//  EnvironmentViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 30-05-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class EnvironmentViewController : UIViewController {
    @IBOutlet weak var ToxicFumesButton: UIButton!
    @IBOutlet weak var SpilledWaterButton: UIButton!
    @IBOutlet weak var FireDangerButton: UIButton!
    
    @IBOutlet weak var LoudNoiseButton: UIButton!
    @IBOutlet weak var SpilledWasteButton: UIButton!
    @IBOutlet weak var SlipperyFloorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
