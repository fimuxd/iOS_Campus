//
//  DetailViewController.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    
    @IBOutlet weak var mainImageViewOutlet: UIImageView!
    
    @IBOutlet weak var recipeNameTextLabel: UILabel!
    @IBOutlet weak var recipeShortDescriptionTextLabel: UILabel!
    @IBOutlet weak var cookTimeTextLabel: UILabel!
    @IBOutlet weak var cookCostTextLabel: UILabel!
    
    @IBOutlet weak var ingrediantsTextLabel: UILabel!
    @IBOutlet weak var recipeTextLebel: UILabel!
    
    var currentRecipe:Recipe?
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realRecipeData:Recipe = currentRecipe {
            self.mainImageViewOutlet.image = UIImage(named: "\(realRecipeData.recipeID).jpg")
            self.recipeNameTextLabel.text = realRecipeData.name
            self.recipeShortDescriptionTextLabel.text = realRecipeData.shortDescriptiion
            self.cookTimeTextLabel.text = "\(realRecipeData.time)분"
            self.cookCostTextLabel.text = "\(realRecipeData.cost)원"
            self.ingrediantsTextLabel.text = realRecipeData.ingrediants
            self.recipeTextLebel.text = realRecipeData.detail
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
