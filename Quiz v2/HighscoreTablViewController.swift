//
//  HighscoreTableViewController.swift
//  Quiz v2
//
//  Created by Katinka Feltes on 03.05.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class HighscoreTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score " + String(score)
        nameLabel.text = name
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Outlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var name = "---"
    
    // MARK: - Methods
    func updateUI(){
        
    }
    @IBAction func testAction(_ sender: Any) {
        addScore(newName: "test", newScore: 5)
    }
    
    func addScore(newName: String, newScore: Int){
        if (newScore > score){
           score = newScore
           scoreLabel.text = "Score " + String(newScore)
           nameLabel.text = newName
           name = newName
        }
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
