//
//  AddNewTacoViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 11/2/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class AddNewTacoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNewTacoButtonPressed() {
        
        let name = "Shark Taco"
        let price = "3"
        let tacoImageURL = "http://www.google.com"
        
        let url = URL(string: "https://taco-stand.herokuapp.com/api/tacos/")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // { "taco": { "name": "Really Yummy Taco iOS Class", "price": "3", "photo_url": "http://www.tacobueno.com/media/1339/beeftacolarge.png?quality=65" } }
        
        let dictionary = ["taco":["name":"Shark Taco","price":"3","photo_url":"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Swift_logo.svg/2000px-Swift_logo.svg.png"]]
        
         let tacoData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        
        request.httpBody = tacoData
        
        URLSession.shared.dataTask(with: request) { (data :Data?, response :URLResponse?, error :Error?) in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
            
            /*
             {
             "taco": {
             "id": 33,
             "name": "Really Yummy Taco iOS Class",
             "url": "https://taco-stand.herokuapp.com/api/tacos/33",
             "photo_url": "http://www.tacobueno.com/media/1339/beeftacolarge.png?quality=65",
             "price": "$3.00",
             "price_in_cents": 300,
             "user": {
             "id": 1,
             "username": "jwo"
             }
             }
             }
             */
            
            let dictionary = json["taco"] as! [String:Any]
            print(dictionary["name"] as! String)
            
            let userDictionary = dictionary["user"] as! [String:Any]
            
            // userDictionary["username"]    --- jwo
            
            
            print(dictionary)
          
            
        }.resume()
        
        
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
