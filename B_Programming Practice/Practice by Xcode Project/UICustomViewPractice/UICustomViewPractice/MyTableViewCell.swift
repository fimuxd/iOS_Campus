//
//  MyTableViewCell.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 12/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var cellImageView:UIImageView?
    @IBOutlet var cellTitle:UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellImageView?.image = #imageLiteral(resourceName: "ChiMac")
        self.cellTitle?.text = "치맥먹고싶다.핵존맛"
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
