//
//  QuizProfile.swift
//  Quiz v2
//
//  Created by Redaktion on 26.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log

class QuizProfile: Highscore {
    
    //MARK: Properties
    private var highestScore: Int
    
    init?(name: String, photo: UIImage, score: Int) {
        self.highestScore = 0
        if score > self.highestScore {
            self.highestScore = score
        }
        super.init(name: name, photo: photo, score: score)
    }
    
    //MARK: NSCoding
    
    required convenience init?(coder aDecoder: NSCoder){
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Highscore/QuizProfile object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Highscore/QuizProfile, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let score = aDecoder.decodeInteger(forKey: PropertyKey.score)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo!, score: score)
    }
}
