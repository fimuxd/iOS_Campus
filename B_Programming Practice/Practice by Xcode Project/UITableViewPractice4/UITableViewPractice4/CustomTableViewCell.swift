//
//  CustomTableViewCell.swift
//  UITableViewPractice4
//
//  Created by Bo-Young PARK on 13/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var contentImage:UIImageView?
    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var subTitleLabel:UILabel?
    @IBOutlet var image1:UIImageView?
    @IBOutlet var image2:UIImageView?
    @IBOutlet var image3:UIImageView?
    @IBOutlet var image4:UIImageView?
    @IBOutlet var image5:UIImageView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.text = "오렌지 이즈 더 뉴 블랙"
        self.titleLabel?.textColor = .lightGray
        self.subTitleLabel?.text = "시즌 5: 11화 \"천장을 뚫어라\""
        self.subTitleLabel?.textColor = .lightGray
        self.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
