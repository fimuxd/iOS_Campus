//
//  MainViewController.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.mainRecipeImageView.image = UIImage(named: "\(indexPath.row).jpg")
        cell.cookTimeLabel.text = "\(DataCenter.shared.recipeList[indexPath.row].time)분"
        cell.recipeNameLabel.text = DataCenter.shared.recipeList[indexPath.row].name
        cell.recipeShortDescriptionLabel.text = DataCenter.shared.recipeList[indexPath.row].shortDescriptiion
        
        switch DataCenter.shared.recipeList[indexPath.row].drink {
        case .beer:
            cell.drinkStickerImageView.image = UIImage(named: "beer")
        case .wine:
            cell.drinkStickerImageView.image = UIImage(named: "wine")
        case .soju:
            cell.drinkStickerImageView.image = UIImage(named: "soju")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let selectedRecipe = DataCenter.shared.recipeList[indexPath.row]
        nextViewController.currentRecipe = selectedRecipe
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
 
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
