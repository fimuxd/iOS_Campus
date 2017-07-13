//
//  CustomDynamicTableViewCell.swift
//  TwitterDynamicCellPractice
//
//  Created by Bo-Young PARK on 13/7/2017.
//  Copyright © 2017 Jongchan Park. All rights reserved.
//

import UIKit

class CustomDynamicTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var twitterIDLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var profileButtonOutlet: UIButton!
    @IBOutlet weak var inputImageButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.inputImageButtonOutlet.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
