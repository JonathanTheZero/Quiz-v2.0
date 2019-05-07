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
        let names = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        if (!scores.isEmpty && !names.isEmpty){
            var x=0
            while(x<3){
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
    
    
    var highscores =  [HighscoreNoPhoto]()
    let first = HighscoreNoPhoto(name: "---", score: 0)!
    let second = HighscoreNoPhoto(name: "---", score: 0)!
    let third = HighscoreNoPhoto(name: "---", score: 0)!
    
    
    // MARK: - Actions
    
    @IBAction func resetAction(_ sender: Any) {
        resetHighscores()
    }
    @IBAction func testAction(_ sender: Any) {
        addScore(newName: "test", newScore: 5)
        addScore(newName: "second", newScore: 6)
    }
    
    // MARK: - Methods
    func updateUI(){
        
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
        
        let scores = [highscores[0].getScore(), highscores[1].getScore(), highscores[2].getScore()]
        
        let names = [highscores[0].getName(),highscores[1].getName(), highscores[2].getName()]
        
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
    }
    
    func resetHighscores(){
        
        highscores = [first ,second , third]
        showHighscores()
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
       
        
        /*highscores = [first ,second , third]
        let scores = [highscores[0].getScore(), highscores[1].getScore(), highscores[2].getScore()]
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
