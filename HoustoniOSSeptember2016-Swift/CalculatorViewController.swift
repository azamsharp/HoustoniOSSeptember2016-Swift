//
//  CalculatorViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/20/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var firstTextField :UITextField!
    @IBOutlet weak var secondTextField :UITextField!
    
    let url = "www.google.com"
    
    var label :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 60))
        self.label.text = "results will be displayed here!"
        self.label.textColor = UIColor.white
        self.label.backgroundColor = UIColor.blue
        self.view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }

    // -(IBAction) calculateButtonPressed:(id) sender { }
    
    @IBAction func calculateButtonPressed() {
        
        let userDefaults = UserDefaults()
        userDefaults.set("12", forKey: "key")
        userDefaults.synchronize()
        
        
        let message = "hello World"
       
        
        let firstNumber = Int(self.firstTextField.text!)
        let secondNumber = Int(self.secondTextField.text!)
        
        let result = firstNumber! + secondNumber!
        
        self.label.text = "\(result)"
        
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
