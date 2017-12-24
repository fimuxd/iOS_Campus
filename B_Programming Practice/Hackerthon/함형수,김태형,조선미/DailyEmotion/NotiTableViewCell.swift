//
//  NotiTableViewCell.swift
//  DailyEmotion
//
//  Created by joe on 2017. 7. 6..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class NotiTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmotionLabel: UILabel!
    @IBOutlet weak var notiComment: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
