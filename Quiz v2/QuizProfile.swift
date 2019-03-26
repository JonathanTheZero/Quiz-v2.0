//
//  QuizProfile.swift
//  Quiz v2
//
//  Created by Redaktion on 26.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class QuizProfile {
    
    var name: String
    var photo: UIImage?
    var highestScore: Int
    
    init?(name: String, photo: UIImage) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.photo = photo
        highestScore = 0
        
    }
    
}
