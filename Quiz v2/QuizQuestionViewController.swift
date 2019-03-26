//
//  QuizQuestionViewController.swift
//  Quiz v2
//
//  Created by Redaktion on 24.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class QuizQuestionViewController: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var questionHeadline: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var outerStack: UIStackView!
    @IBOutlet weak var innerStackRowOne: UIStackView!
    @IBOutlet weak var innerStackRowTwo: UIStackView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var q = Question(quest: "Wie heißt die Hauptstadt von Deutschland?", answer1: "München", answer2: "Berlin", answer3: "Hamburg", answer4: "Bremen", corr: 2)!
    
    var correctVal = 0
    var score = 0
    
    override func viewDidLoad() {
        setText(question: q)
        scoreLabel.text = ""
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func setText(question: Question){
        questionHeadline.text = question.getQuestion()

        answerButton1.setTitle(question.getAnswer(i: 0), for: .normal)
        answerButton2.setTitle(question.getAnswer(i: 1), for: .normal)
        answerButton3.setTitle(question.getAnswer(i: 2), for: .normal)
        answerButton4.setTitle(question.getAnswer(i: 3), for: .normal)
        
        correctVal = q.getCorrect()
    }
    
    //MARK: Actions
    
    @IBAction func tapOnButton1(_ sender: UIButton) {
        if(correctVal == 1){
            questionHeadline.text = "Glückwunsch"
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
        else{
            questionHeadline.text = "Leider falsch"
        }
    }
    
    @IBAction func tapOnButton2(_ sender: UIButton) {
        if(correctVal == 2){
            questionHeadline.text = "Glückwunsch"
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
        else{
            questionHeadline.text = "Leider falsch"
        }
    }
    
    @IBAction func tapOnButton3(_ sender: UIButton) {
        if(correctVal == 3){
            questionHeadline.text = "Glückwunsch"
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
        else{
            questionHeadline.text = "Leider falsch"
        }
    }
    
    @IBAction func tapOnButton4(_ sender: UIButton) {
        if(correctVal == 4){
            questionHeadline.text = "Glückwunsch"
            score += 1
            scoreLabel.text = "Score: " + String(score)
        }
        else{
            questionHeadline.text = "Leider falsch"
        }
    }
}
