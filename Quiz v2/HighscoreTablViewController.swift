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
        scoreLabel1.text = "Score " + String(score)
        nameLabel1.text = name
        super.viewDidLoad()
        
       
       // Do any additional setup after loading the view.
    }
    
    // MARK: - Outlet
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var nameLabel1: UILabel!
    
    
    
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
           scoreLabel1.text = "Score " + String(newScore)
           nameLabel1.text = newName
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
