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
        
        for day in 1...7 {
           
            // create a date which is one day in the past
            let daysInPast = calendar.date(byAdding: Calendar.Component.day, value: -day, to: Date())
            
            print(daysInPast!)
            
            self.pedometer.queryPedometerData(from: daysInPast!, to: Date()) { (data :CMPedometerData?, error :Error?) in
    
                //data?.distance
                //data?.floorsAscended
                //data?.floorsDescended
                
                print(data?.numberOfSteps)
                
            }
            
        }
        
       
        
    }
    
}
