//
//  ViewController.swift
//  Quiz v2
//
//  Crated by Redaktion on 19.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var mainMenu: UIStackView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var highscores: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
}

