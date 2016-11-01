//
//  PokemonAnnotationView.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 11/1/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        let image = UIImage(named: "Pokemon-Image")
        let imgView = UIImageView(image: image)
        
        imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        self.addSubview(imgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
