//
//  DetailViewController.swift
//  UITableViewPractice
//
//  Created by Bo-Young PARK on 2/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labeld: UILabel!
    
    var imageName:String?
    var poketName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageName = self.imageName ?? "DefaultImageName"
        let pocketName = self.poketName ?? "No Named"
        
        image.image = UIImage(named: imageName)
        labeld.text = pocketName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
