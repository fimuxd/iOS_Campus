//
//  MainTableViewCell.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    //****************************************//
    //               IBOutlet                 //
    //****************************************//
    
    @IBOutlet weak var inputMemberNameTextField: UITextField!
    
    
    //****************************************//
    //              LifeCycle                 //
    //****************************************//
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
