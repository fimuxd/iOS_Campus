//
//  CustomNibTableViewCell.swift
//  TableViewNibPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomNibTableViewCell: UITableViewCell {

    /*********************************************/
    //              IBOutlet | 전역변수             //
    /*********************************************/
    @IBOutlet weak var squareImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var subTitleTextLabel: UILabel!
    @IBOutlet weak var cellSwitchAcc: UISwitch!
    
    static let reuseIdentifier:String = "CustomNibTableViewCell"
    static let cellHeight:Double = 80.0
    
    
    /*********************************************/
    //             IBAction | Methods            //
    /*********************************************/
    
    
    
    
    
    /*********************************************/
    //                  LifeCycle                //
    /*********************************************/
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
