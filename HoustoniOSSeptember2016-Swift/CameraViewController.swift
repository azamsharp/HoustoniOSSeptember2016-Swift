//
//  CameraViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 10/24/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreImage

class CameraViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView :UIImageView!
    
    var originalImage :UIImage!

    var imagePickerController :UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.photoImageView.image = originalImage
        
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
         self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    /*
     /*
     let image = self.originalImage
     
     let beginImage = CIImage(image: image)
     
     guard let sepiaFilter = CIFilter(name: "CISepiaTone") else {
     fatalError("Error creating Sepia Filter")
     }
     
     sepiaFilter.setValue(beginImage, forKey: kCIInputImageKey)
     sepiaFilter.setValue(1.0, forKey:kCIInputIntensityKey)
     
     let newImage = UIImage(CIImage: (sepiaFilter.outputImage)!)
     */
     
     
     */
    
    @IBAction func applySepiaFilter() {
        
//        let someString :String?
//        
//       // someString = nil
//        
//        someString = "Hello World"
//        
//        print(someString!)
//        
//        if let str = someString {
//            print(str)
//        }
//        
//        guard let someOtherString = someString else {
//            return
//        }
        
        
        let sepiaFilter = CIFilter(name: "CISepiaTone")
        
        //print(someString!)
        
        // original image is of type UIImage
        // CIImage = CoreImage Image
        
        let beginImage = CIImage(image: self.originalImage)
        sepiaFilter?.setValue(beginImage, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(1.0,  forKey:kCIInputIntensityKey)
        
        self.originalImage = UIImage(ciImage: (sepiaFilter?.outputImage)!)
        
        self.photoImageView.image = self.originalImage
    }
    
    @IBAction func openCameraButtonPressed() {
        
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: "Select Option", message: "", preferredStyle: .actionSheet)
        
     //   let alert = UIAlertAction(title: "HELO", style: .default, handler: nil)
        
     //   alertController.addAction(alert)
        
        let photoLibraryAction = UIAlertAction(title: "Pick from Library", style: .default) { (alert :UIAlertAction) in
            
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
            
        }
        
        let cameraAction = UIAlertAction(title: "Take a Picture", style: .default) { (alert :UIAlertAction) in
            
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
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
