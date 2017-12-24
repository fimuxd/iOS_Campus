//
//  UserAnswerButton.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/8/17.
//  Copyright © 2017 DY. All rights reserved.
//

import UIKit

class UserAnswerButton: UIButton {

//    var color:UIColor?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib()
    {
        super.awakeFromNib()

//        self.backgroundColor = .orange
//        self.layer.cornerRadius = 10
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 1
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.width / 2
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 
//        self.backgroundColor = color

    }

}
