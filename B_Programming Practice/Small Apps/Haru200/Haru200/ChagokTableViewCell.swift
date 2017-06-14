//
//  ChagokTableViewCell.swift
//  Haru200
//
//  Created by Bo-Young PARK on 14/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ChagokTableViewCell: UITableViewCell {
    
    /*****************************************************************************/
    //                                IBOutlet                                    //
    /*****************************************************************************/
    
    @IBOutlet weak var diaryTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentCharacterCount: UILabel!
    
    /*****************************************************************************/
    //                                  Life Cycle                               //
    /*****************************************************************************/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
