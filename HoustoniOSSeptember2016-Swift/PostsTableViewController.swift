//
//  PostsTableViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/31/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit

class Post {
    
    var userId :Int!
    var title :String!
    var body :String!
    var imageURL :String!
}

class PostsTableViewController: UITableViewController {

    var posts :[Post]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.posts = [Post]()
        
        let postsURL = "https://jsonplaceholder.typicode.com/photos"
        
        let url = URL(string: postsURL)
        
        URLSession.shared.dataTask(with: url!) { (data :Data?, response :URLResponse?, error :Error?) in
            
            let result = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
            
            for item in result {
             
                let post = Post()
              //  post.userId = item["userId"] as! Int
                post.title = item["title"] as! String
                post.imageURL = item["thumbnailUrl"] as! String
               // post.body = item["body"] as! Stringum
                
                self.posts.append(post)
                
            }
           
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
         //   let dictionary = result[0]
            
//            let userDictionary = dictionary["user"]
//            let profileImageURL = userDictionary["profile_image_url"]
//            let urlsDictionary =  userDictionary["urls"]
//            
          //  print(dictionary["title"]!)
            
          //  print(dictionary)
            
        }.resume()
        
        print("hello world")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let post = self.posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        
        DispatchQueue.global().async {
            
            let imageData = try! Data(contentsOf: URL(string: post.imageURL)!)
            
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
