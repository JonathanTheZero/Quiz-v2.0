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
        
        highscores = [first ,second , third, fourth, fifth, sixth]
        let defaults = UserDefaults.standard
        let scores = defaults.array(forKey: "SavedScoreArray")  as? [Int] ?? [Int]()
        let names = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        if (!scores.isEmpty && !names.isEmpty){
            var x=0
            while(x<6){
                highscores[x].setScore(pScore: scores[x])
                highscores[x].setName(pName: names[x])
                x=x+1
            }
        }
        showHighscores()
        super.viewDidLoad()
    }
    
    // MARK: - Outlet
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var scoreLabel3: UILabel!
    @IBOutlet weak var nameLabel4: UILabel!
    @IBOutlet weak var scoreLabel4: UILabel!
    @IBOutlet weak var nameLabel5: UILabel!
    @IBOutlet weak var scoreLabel5: UILabel!
    @IBOutlet weak var nameLabel6: UILabel!
    @IBOutlet weak var scoreLabel6: UILabel!
    
    var highscores =  [HighscoreNoPhoto]()
    let first = HighscoreNoPhoto(name: "---", score: 0)!
    let second = HighscoreNoPhoto(name: "---", score: 0)!
    let third = HighscoreNoPhoto(name: "---", score: 0)!
    let fourth = HighscoreNoPhoto(name: "---", score: 0)!
    let fifth = HighscoreNoPhoto(name: "---", score: 0)!
    let sixth = HighscoreNoPhoto(name: "---", score: 0)!
    
    
    // MARK: - Actions
    
    @IBAction func testAction(_ sender: Any) {
        addScore(newName: "test", newScore: 0)
        addScore(newName: "bjjd", newScore: 1)
    }
    
    // MARK: - Methods
    func updateUI(){
        
    }
    func addScore(newName: String, newScore: Int){
        var x = 0;
        while (x < 6){
            if (newScore <= highscores[x].getScore()){
                x = x+1
            }
            else{
                let oldName = highscores[x].getName()
                let oldScore = highscores[x].getScore()
                highscores[x].setScore(pScore: newScore)
                highscores[x].setName(pName: newName)
                addScore(newName: oldName, newScore: oldScore)
                x = 6
            }
        }
        showHighscores()
        
        let scores = [highscores[0].getScore(), highscores[1].getScore(), highscores[2].getScore(), highscores[3].getScore(), highscores[4].getScore(), highscores[5].getScore()]
        
        let names = [highscores[0].getName(),highscores[1].getName(), highscores[2].getName(),highscores[3].getName(),highscores[4].getName(), highscores[5].getName()]
        
        let defaults = UserDefaults.standard
        defaults.set(scores, forKey: "SavedScoreArray")
        defaults.set(names, forKey: "SavedStringArray")
    }
    
    func showHighscores(){
       
        scoreLabel1.text = "Score " + String(highscores[0].getScore())
        nameLabel1.text = highscores[0].getName()
        scoreLabel2.text = "Score " + String(highscores[1].getScore())
        nameLabel2.text = highscores[1].getName()
        scoreLabel3.text = "Score " + String(highscores[2].getScore())
        nameLabel3.text = highscores[2].getName()
        scoreLabel4.text = "Score " + String(highscores[3].getScore())
        nameLabel4.text = highscores[3].getName()
        scoreLabel5.text = "Score " + String(highscores[4].getScore())
        nameLabel5.text = highscores[4].getName()
        scoreLabel6.text = "Score " + String(highscores[5].getScore())
        nameLabel6.text = highscores[5].getName()
    }
    
    /*func resetHighscores(){
        
        highscores = [first ,second , third]
        showHighscores()
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
       
        
        /*highscores = [first ,second , third]
        let scores = [highscores[0].getScore(), highscores[1].getScore(), highscores[2].getScore()]
        let defaults = UserDefaults.standard
        defaults.set(scores, forKey: "SavedScoreArray")*/
    }*/
    
    
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
