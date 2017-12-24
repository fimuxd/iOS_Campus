//
//  mainCustomCell.swift
//  DailyEmotion
//
//  Created by joe on 2017. 7. 6..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class mainCustomCell: UITableViewCell {

    
    @IBOutlet weak var emotionImageView: UIImageView?
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userTodayEmotion: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBAction func editOrSetButton(_ sender: UIButton) {
    }
    
    var userName: String = ""
    var userEmotion: String = ""
    var comment: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
