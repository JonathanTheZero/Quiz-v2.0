//
//  QuizHighscoresTableViewCell.swift
//  Quiz v2
//
//  Created by Redaktion on 21.03.19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class QuizHighscoresTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    


}
