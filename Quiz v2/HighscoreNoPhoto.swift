//
//  HighscoreTable.swift
//  Quiz v2
//
//  Created by Katinka Feltes on 05.05.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log


class HighscoreNoPhoto: NSObject, NSCoding {
    
    //MARK: Properties
    
    var score = 0
    var name = "---"
    
    
    //MARK: Initialization
    
    init?(name: String, score: Int) {
        if name.isEmpty || score < 0 {
            return nil
        }
        
        //set attributes
        self.name = name
        self.score = score
    }
    
    
    struct PropertyKey {
        static let name = "name"
        static let score = "score"
    }
    
    
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(score, forKey: PropertyKey.score)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Highscore object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Highscore, just use conditional cast.
      
        let score = aDecoder.decodeInteger(forKey: PropertyKey.score)
        
        // Must call designated initializer.
        self.init(name: name, score: score)
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("highscores")
}

