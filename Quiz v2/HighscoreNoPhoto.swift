//
//  HighscoreTable.swift
//  Quiz v2
//
//  Created by Katinka Feltes on 05.05.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log


class HighscoreNoPhoto{
    
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
    
    
   /* struct PropertyKey {
        static let name = "name"
        static let score = "score"
    }*/
    func getName() -> String{
        return name
    }
    
    func getScore() -> Int{
        return score
    }
    
    func setName(pName: String){
        self.name=pName
    }
    
    func setScore(pScore: Int){
        self.score=pScore
    }
    
}
