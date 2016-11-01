//
//  ActivityIndicatorViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/31/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {

    @IBOutlet weak var activityIndicator :UIActivityIndicatorView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
  
    self.activityIndicator.isHidden = true
        
    }

    @IBAction func fetchDataButtonPressed(_ sender: AnyObject) {
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        // main = UI Thread
        
        // global = background
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
            
            // apply filters
            
            print("FETCH LARGE AMOUNTS OF DATA")
            
            DispatchQueue.main.async {
                  self.activityIndicator.isHidden = true
            }
            
        }
        
      
        
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
