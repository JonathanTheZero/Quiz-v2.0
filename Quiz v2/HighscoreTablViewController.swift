//
//  HighscoreTableViewController.swift
//  Quiz v2
//
//  Created by Katinka Feltes on 03.05.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class HighscoreViewControllerKatinka: UIViewController {

    override func viewDidLoad() {
        highscores = [first ,second , third]
        let defaults = UserDefaults.standard
        let scores = defaults.array(forKey: "SavedScoreArray")  as? [Int] ?? [Int]()
        if (!scores.isEmpty){
            var x=0
            while(x<3){
            highscores[x].setScore(pScore: scores[x])
            x=x+1
            }
        }
        showHighscores()
        super.viewDidLoad()
        /*let defaults = UserDefaults.standard
        let highscores = defaults.array(forKey: "SavedHighscoreArray")  as? [HighscoreNoPhoto] ?? [HighscoreNoPhoto]()*/
       
        
       
       // Do any additional setup after loading the view.
    }
    
    // MARK: - Outlet
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var scoreLabel3: UILabel!
    
    
    var highscores =  [HighscoreNoPhoto]()
    let first = HighscoreNoPhoto(name: "---", score: 0)!
    let second = HighscoreNoPhoto(name: "---", score: 0)!
    let third = HighscoreNoPhoto(name: "---", score: 0)!
    
    /*var score = 0
    var name = "---"*/
    
    // MARK: - Methods
    func updateUI(){
        
    }
    @IBAction func resetAction(_ sender: Any) {
        resetHighscores()
    }
    @IBAction func testAction(_ sender: Any) {
       /* highscores[0].setScore(pScore: 11)
        highscores[0].setName(pName: "newName")*/
        addScore(newName: "test", newScore: 5)
        addScore(newName: "second", newScore: 6)
    }
    
    func addScore(newName: String, newScore: Int){
        var x = 0;
        while (x < 3){
            if (newScore <= highscores[x].getScore()){
                x = x+1
            }
            else{
                let oldName = highscores[x].getName()
                let oldScore = highscores[x].getScore()
                highscores[x].setScore(pScore: newScore)
                highscores[x].setName(pName: newName)
                addScore(newName: oldName, newScore: oldScore)
                x = 3
            }
        }
        showHighscores()
        let score1 = highscores[0].getScore()
        let score2 = highscores[1].getScore()
        let score3 = highscores[2].getScore()
        let scores = [score1, score2, score3] 
        
        let defaults = UserDefaults.standard
        defaults.set(scores, forKey: "SavedScoreArray")
        /*let defaults = UserDefaults.standard
        defaults.set(highscores, forKey: "SavedHighscoreArray")*/
    }
    
    func showHighscores(){
        scoreLabel1.text = "Score " + String(highscores[0].getScore())
        nameLabel1.text = highscores[0].getName()
        scoreLabel2.text = "Score " + String(highscores[1].getScore())
        nameLabel2.text = highscores[1].getName()
        scoreLabel3.text = "Score " + String(highscores[2].getScore())
        nameLabel3.text = highscores[2].getName()
    }
    
    func resetHighscores(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        /*highscores = [first ,second , third]
        let scores = [highscores[0].getScore(), highscores[1], highscores[2]] as [Any] 
        let defaults = UserDefaults.standard
        defaults.set(scores, forKey: "SavedScoreArray")*/
    }
    
    
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
