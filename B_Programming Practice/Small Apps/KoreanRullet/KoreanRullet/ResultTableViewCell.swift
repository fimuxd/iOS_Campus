//
//  ResultTableViewCell.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    //****************************************//
    //               IBOutlet                 //
    //****************************************//
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    
    
    //****************************************//
    //              LifeCycle                 //
    //****************************************//
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
