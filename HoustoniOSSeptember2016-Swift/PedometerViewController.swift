//
//  PedometerViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/25/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class PedometerViewController : UIViewController {
    
    var pedometer :CMPedometer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.pedometer = CMPedometer()
        
        let calendar = Calendar.current
        let twoDaysAgo = calendar.date(byAdding: .day, value: -2, to: Date())
        
        self.pedometer.queryPedometerData(from: twoDaysAgo!, to: Date()) { (data :CMPedometerData?, error :Error?) in
            
            print(data?.numberOfSteps)
            
            print("Getting historical data")
            
        }
        
    }
    
}
