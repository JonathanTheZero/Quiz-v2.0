//
//  SettingsViewController.swift
//  Quiz v2
//
//  Created by Redaktion on 31.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var profileStack: UIStackView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var createNewProfile: UIButton!
    @IBOutlet weak var changeProfile: UIButton!
    
    override func viewDidLoad() {
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

    @IBAction func clickOnNewProfile(_ sender: UIButton) {
        let alert = UIAlertController(title: "Was ist dein Name?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Gib hier deinen Namen ein"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                var q = QuizProfile(name: name, photo: UIImage(named: "DefaultProfilePicture")!, score: 0)
            }
        }))
        
        self.present(alert, animated: true)
    }
}
