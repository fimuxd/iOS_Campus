//
//  SevenDayTableViewCell.swift
//  HackerTonePractice
//
//  Created by 김태형 on 2017. 7. 6..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class SevenDayTableViewCell: UITableViewCell {
    
    let date = Date()
    let calendar = Calendar.current
    

    override func awakeFromNib() {
        super.awakeFromNib()
        

        let day2 = calendar.component(.weekday, from: date)
        print(day2)

        
        
//
//        
//        let dateComponnet = DateComponents(calendar: calender)
//        dateComponnet.day
//        print(dateComponnet)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
