//
//  Pokemon.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 11/1/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import Foundation

struct Pokemon {
    
    var name :String
    var imageURL :String
    var latitude :Double = 0
    var longitude :Double = 0
}

extension Pokemon {
    
    init(name :String, imageURL :String) {
        self.name = name
        self.imageURL = imageURL
    }
    
    init() {
        self.name = ""
        self.imageURL = ""
    }
    
}
