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
        scoreLabel.text = "Score: 0"
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
    func quitQuiz(){
        /*let next:QuizViewController = storyboard?.instantiateViewController(withIdentifier:"QuizViewController") as! QuizViewController
        self.navigationController?.pushViewController(next, animated: true)
        let viewController = ExitScreenViewController(nibName: "ExitScreenViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)*/
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "newViewController") as! ExitScreenViewController
        self.present(newViewController, animated: true, completion: nil)
    }

    func setText(question: Question){
        questionHeadline.text = question.getQuestion()

        answerButton1.setTitle(question.getAnswer(i: 0), for: .normal)
        answerButton2.setTitle(question.getAnswer(i: 1), for: .normal)
        answerButton3.setTitle(question.getAnswer(i: 2), for: .normal)
        
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
    
    
    func generateQuestions(){
        /*questions[0] = Question(quest: "Wie heißt die Hauptstadt von Deutschland?", answer1: "München", answer2: "Berlin", answer3: "Hamburg", answer4: "Bremen", corr: 2)!
        questions[1] = Question(quest: "Welceh Flüssigkeit schmilzt bei 0°C?", answer1: "Essig", answer2: "Cola", answer3: "Wasser", answer4: "Whisky", corr: 3)!*/
        let q1 = Question(quest: "Was versteht man unter einem CO2-Fußabdruck?", answer1: " Die CO2 Menge, die ein Mensch in seinem Leben durch Atmen ausstößt", answer2: " Die CO2 Menge, die ein Fußabdruck auf dem Boden hinterlässt, wenn man Barfuß läuft", answer3: "Die CO2 Menge, die durch den aktuellen Lebensstil eines Menschen verursacht wird", corr: 3)!
        let q2 = Question(quest: "Was ist virtuelles Wasser?", answer1: "Die Menge Wasser, die bei einer Dienstleistung oder zur Herstellung eines Produktes verwendet wurde", answer2: "Wasser in Computer-Spielen wie Farm-Ville", answer3: "Gibt es gar nicht." , corr: 1 )!
        let q3 = Question(quest: "Wie hoch ist der Wirkungsgrad eines modernen Kohlekraftwerks?", answer1: "Bis zu 85%", answer2: "Bis zu 55%", answer3: "Bis zu 65%", corr: 2)!
        let q4 = Question(quest: "Wie hoch ist der durchschnittliche Wirkungsgrad eines Laufwasserkraftwerks?", answer1: " Bis zu 95%", answer2: " Bis zu 65%", answer3: " Bis zu 35%", corr: 1)!
        let q5 = Question(quest: "Wieviel virtuelles Wasser steckt in einer Tasse Kaffe?", answer1: "1,4l", answer2: "140ml", answer3: "140l", corr: 3)!
        let q6 = Question(quest: "Wieviel virtuelles Wasser steckt in 1Kg Tomaten?", answer1: "3,5l", answer2: "35l", answer3: "350l", corr: 2)!
        let q7 = Question(quest: "Wieviel Wasser werden bei der Herstellung einer Jeans verbraucht und wieviel C02 wird produziert?", answer1: "11000l Wasser und ca. 23kg CO2", answer2: "5l Wasser und 0,5kg CO2", answer3: "35l Wasser und 15kg CO2", corr: 1)!
        let q8 = Question(quest: "Eine konventionelle alte Glühlampe wandelt nur knapp 5%-10% der Energie in Licht um, der Rest geht als Wärme „verloren“. Wieviel wandelt eine moderne LED-Lampe in Licht um?", answer1: "15%-25%", answer2: "40%-50%", answer3: ": 70%-80%", corr: 2)!
        let q9 = Question(quest: "Mit 1kWh elektrischer Energie, kann man ca. 4h am Computer arbeiten. Wieviel Kohle werden für die Erzeugung von 1kWh Strom benötigt und wievielC=2 entsteht dabei durchschnittlich?", answer1: " 640g Kohle und 1486g CO2", answer2: "160g Kohle und 371,5g CO2", answer3: " 320g Kohle und 743g CO2", corr: 3)!
        let q10 = Question(quest: "Wie lange kann man mit einer modernen Duschbrause duschen, wenn man stattdessen auf ein Vollbad in der Badewanne verzichtet?", answer1: "ca. 15Min-20Min", answer2: "ca. 25Min-30Min", answer3: "ca. 5Min-10Min", corr: 2)!
        questions += [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
    }
    
    private func correct(){
        ProgressHUD.showSuccess("Richtig")
        score += 1
        if score >= questions.count {
            //TBA: Finish screen
            scoreLabel.text = "Score: " + String(score)
            
            let alert = UIAlertController(title: "Glückwunsch!", message: "Du hast alle Fragen richtig beantwortet", preferredStyle: .alert)
            let finishAction = UIAlertAction(title: "OK", style: .default)
            { (alertAction) in
                self.quitQuiz()}
            alert.addAction(finishAction)
            self.present(alert, animated: true, completion: nil)
            quitQuiz()
        }
        else {
            setText(question: questions[score])
            scoreLabel.text = "Score: " + String(score)
        }
    }
    
    private func wrong(){
        ProgressHUD.showError("Falsch")
        quitQuiz()
        let alert = UIAlertController(title: "Schade", message: "Probiers doch gleich noch einmal", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Bitte gib hier deinen Namen ein"
        })
        let finishAction = UIAlertAction(title: "Weiter", style: .default) { (alertAction) in self.quitQuiz()
            }
        
        alert.addAction(finishAction)
        self.present(alert, animated: true, completion: nil)
        
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! ExitScreenViewController
        self.present(nextViewController, animated:true, completion:nil)
        let vc = ExitScreenViewController(nibName: "ExitViewController", bundle: nil)
        //vc.yourScoreLabel.text = "Your Score: "
        navigationController?.pushViewController(vc, animated: true) */
    }
    
}
