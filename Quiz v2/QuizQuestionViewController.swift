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
    
    var questions = [Question]()
    
    var correctVal = 0
    public var score = 0
    
    override func viewDidLoad() {
        generateQuestions()
        setText(question: questions[0])
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
        
        correctVal = question.getCorrect()
    }
    
    //MARK: Actions
    
    @IBAction func tapOnButton1(_ sender: UIButton) {
        if(correctVal == 1){
            correct()
        }
        else{
            wrong()
        }
    }
    
    @IBAction func tapOnButton2(_ sender: UIButton) {
        if(correctVal == 2){
            correct()
        }
        else{
            wrong()
        }
    }
    
    @IBAction func tapOnButton3(_ sender: UIButton) {
        if(correctVal == 3){
            correct()
        }
        else{
            wrong()
        }
    }
    
    @IBAction func tapOnButton4(_ sender: UIButton) {
        if(correctVal == 4){
            correct()
        }
        else{
            wrong()
        }
    }
    
    func generateQuestions(){
        /*questions[0] = Question(quest: "Wie heißt die Hauptstadt von Deutschland?", answer1: "München", answer2: "Berlin", answer3: "Hamburg", answer4: "Bremen", corr: 2)!
        questions[1] = Question(quest: "Welceh Flüssigkeit schmilzt bei 0°C?", answer1: "Essig", answer2: "Cola", answer3: "Wasser", answer4: "Whisky", corr: 3)!*/
        let q1 = Question(quest: "Wie heißt die Hauptstadt von Deutschland?", answer1: "München", answer2: "Berlin", answer3: "Hamburg", answer4: "Bremen", corr: 2)!
        let q2 = Question(quest: "Welche Flüssigkeit schmilzt bei 0°C?", answer1: "Essig", answer2: "Cola", answer3: "Wasser", answer4: "Whisky", corr: 3)!
        questions += [q1, q2]
    }
    
    private func correct(){
        questionHeadline.text = "Glückwunsch"
        score += 1
        if score >= questions.count {
            //TBA: Finish screen
            questionHeadline.text = "Glückwunsch, du hast alle Fragen richtig beantwrotet!"
            scoreLabel.text = "Score: " + String(score)
        }
        else {
            setText(question: questions[score])
            scoreLabel.text = "Score: " + String(score)
        }
    }
    
    private func wrong(){
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! ExitScreenViewController
        self.present(nextViewController, animated:true, completion:nil)*/
        let vc = ExitScreenViewController(nibName: "ExitViewController", bundle: nil)
        //vc.yourScoreLabel.text = "Your Score: "
        navigationController?.pushViewController(vc, animated: true)
    }
}
