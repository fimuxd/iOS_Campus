//
//  CustomTableViewCell.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    
    @IBOutlet weak var mainRecipeImageView: UIImageView!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeShortDescriptionLabel: UILabel!
    @IBOutlet weak var drinkStickerImageView: UIImageView!
    
    var indexPath:Int?
    
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    
    
    
    
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainRecipeImageView.image = UIImage(named: "\(indexPath!).jpg")
        self.cookTimeLabel.text = "\(DataCenter.shared.recipeList[indexPath!].time)"
        self.recipeNameLabel.text = DataCenter.shared.recipeList[indexPath!].name
        self.recipeShortDescriptionLabel.text = DataCenter.shared.recipeList[indexPath!].shortDescriptiion
        self.drinkStickerImageView.image 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
