//
//  CustomCountLabel.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 12/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomCountLabel: UIView {
    
    @IBOutlet var countLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .red
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.width/2
        self.countLabel?.textColor = .white
    }
    
  
    
    
}
