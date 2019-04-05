//
//  QuizHighscoresTableViewController.swift
//  Quiz v2
//
//  Created by Redaktion on 22.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import os.log

class QuizHighscoresTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    //MARK: Properties
    
    var highscores = [Highscore]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let sampleScores = loadScores(){
            highscores += sampleScores
        }
        else {
            loadSampleScores()
        }
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

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            highscores.remove(at: indexPath.row)
            saveScores()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

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
    
    @IBAction func unwindToHighscoreList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? QuizQuestionViewController, let highscore = sourceViewController.h {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing highscore TBA since no check yet
                highscores[selectedIndexPath.row] = highscore
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new highscore.
                let newIndexPath = IndexPath(row: highscores.count, section: 0)
                
                highscores.append(highscore)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            loadScores()
        }
    }
    
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }*/
    
    //MARK: Events?
    
    @IBAction func selectPhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: Private Methods
    
    private func loadSampleScores(){
        let photo1 = UIImage(named: "Image")
        
        guard let score1 = Highscore(name: "Jonathan", photo: photo1, score: 5) else {
            fatalError("Sample not working")
        }
        guard let score2 = Highscore(name: "Test", photo: UIImage(named: "SampleProfilePicture"), score: 4) else {
            fatalError("Sample 2 not working")
        }
        
        highscores += [score1, score2]
        
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
