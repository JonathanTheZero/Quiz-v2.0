//
//  Question.swift
//  Quiz v2
//
//  Created by Redaktion on 24.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

class Question {
    
    private var question: String
    private var answers = [String]()
    private var correct: Int
    
    init?(quest: String, answer1: String, answer2: String, answer3: String, answer4: String, corr: Int){
        
        //validate input
        if(quest.isEmpty || answer1.isEmpty || answer2.isEmpty || answer3.isEmpty || answer4.isEmpty || corr < 1 || corr > 4){
            fatalError("The Question Input is not validate")
            return nil
        }
        
        self.question = quest
        self.answers += [answer1, answer2, answer3, answer4]
        self.correct = corr
    }
    
    func getAnswer(i: Int) -> String{
        return answers[i]
    }
    
    func getQuestion() -> String{
        return question
    }
    
    func getCorrect() -> Int{
        return correct
    }

}
