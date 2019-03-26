//
//  Highscore.swift
//  Quiz v2
//
//  Created by Redaktion on 22.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log


class Highscore: NSObject, NSCoding {
    
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
    
    init?(profile: QuizProfile){
        
        self.name = profile.name
        self.photo = profile.photo
        self.score = 0 //TBC
    }
    
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let score = "score"
    }
    
    
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(score, forKey: PropertyKey.score)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let score = aDecoder.decodeInteger(forKey: PropertyKey.score)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, score: score)
        
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("highscores")
}
