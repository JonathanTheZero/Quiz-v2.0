//
//  Highscore.swift
//  Quiz v2
//
//  Created by Redaktion on 22.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class Highscore {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var score: Int
    
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, score: Int) {
        //Initialization failed
        if name.isEmpty || score < 0 {
            return nil
        }
        
        //set attributes
        self.name = name
        self.photo = photo
        self.score = score
    }
    
    
}
