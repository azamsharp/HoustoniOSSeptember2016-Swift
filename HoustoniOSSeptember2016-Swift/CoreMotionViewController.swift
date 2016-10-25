//
//  CoreMotionViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/24/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {

    private var coreMotionManager :CMMotionManager!
    var photoImageView :UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.photoImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.photoImageView.image = UIImage(named: "SwitifyApp-1024")
        
        self.view.addSubview(self.photoImageView)
        self.coreMotionManager = CMMotionManager()
        
        if self.coreMotionManager.isDeviceMotionAvailable {
            
            self.coreMotionManager.deviceMotionUpdateInterval = 0.1
            self.coreMotionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data :CMDeviceMotion?, error :Error?) in
                
                if let gravity = data?.gravity {
                   
                    self.photoImageView.center = CGPoint(x: gravity.x * 5, y: gravity.y * 5)
                    
                   // let rotation = atan2(gravity.x, gravity.y) - M_PI
                   // self.photoImageView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
                }
                
                /*
                 if let gravity = data?.gravity {
                 let rotation = atan2(data.gravity.x, data.gravity.y) - M_PI
                 self?.imageView.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
                 }
                */
                
            })
            
        }
        
        
//        if self.coreMotionManager.isAccelerometerAvailable {
//            self.coreMotionManager.accelerometerUpdateInterval = 0.1
//            self.coreMotionManager.startAccelerometerUpdates(to :OperationQueue.main, withHandler: { (data :CMAccelerometerData?, error :Error?) in
//                
//                if let acceleration = data?.acceleration {
//                    
//                    let rotation = atan2(acceleration.x,acceleration.y) - M_PI
//                    self.photoImageView.transform = CGAffineTransform(rotationAngle :CGFloat(rotation))
//                }
//                
//                /*
//                 if let acceleration = data?.acceleration {
//                 let rotation = atan2(acceleration.x, acceleration.y) - M_PI
//                 self?.imageView.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
//                 }
//                 
//                 */
//                
//            })
//            
//        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
