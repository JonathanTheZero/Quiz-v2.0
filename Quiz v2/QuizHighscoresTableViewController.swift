//
//  QuizHighscoresTableViewController.swift
//  Quiz v2
//
//  Created by Redaktion on 22.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log

class QuizHighscoresTableViewController: UITableViewController {

    //MARK: Properties
    
    var highscores = [Highscore]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadSampleScores()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highscores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "QuizHighscoresTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuizHighscoresTableViewCell  else {
            fatalError("The dequeued cell is not an instance of QuizHighscoresTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let score = highscores[indexPath.row]
        
        cell.nameLabel.text = score.name
        cell.userImageView.image = score.photo
        cell.scoreLabel.text = "Highcore: " + String(score.score)
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Private Methods
    
    private func loadSampleScores(){
        let photo1 = UIImage(named: "Image")
        
        guard let score1 = Highscore(name: "Jonathan", photo: photo1, score: 5) else {
            fatalError("Sample not working")
        }
        
        highscores += [score1]
        
    }
    
    private func loadScores() -> [Highscore]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Highscore.ArchiveURL.path) as? [Highscore]
    }
    
    private func saveScores(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(highscores, toFile: Highscore.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Highscore successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save highscore...", log: OSLog.default, type: .error)
        }
    }
    
}
