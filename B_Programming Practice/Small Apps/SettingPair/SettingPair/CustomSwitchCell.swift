//
//  CustomSwitchCell.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class CustomSwitchCell: UITableViewCell {

    /*******************************************/
    //                  Outlet                 //
    /*******************************************/
    
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBAction func switchAction(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /*******************************************/
    //                  func                   //
    /*******************************************/
    
    func setCellTitle(_ title:String){
        
        titleLabel.text! = title
        
    }
    
}
