//
//  SettingsViewController.swift
//  Quiz v2
//
//  Created by Redaktion on 31.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Highscores zurücksetzten", message: "Sind sie sich sicher?", preferredStyle: .alert)
        
        let finishAction = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
        }
        let quitAction = UIAlertAction(title: "Abbrechen", style: .default, handler: nil)
        alert.addAction(finishAction)
        alert.addAction(quitAction)
        
        self.present(alert, animated: true, completion: nil)
        
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
