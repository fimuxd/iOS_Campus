//
//  ListTableViewCell.swift
//  HackerTon
//
//  Created by 이재성 on 2017. 7. 6..
//  Copyright © 2017년 jaeseong. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var writeTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
