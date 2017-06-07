//
//  DetailViewController.swift
//  TableViewPractice2
//
//  Created by Bo-Young PARK on 7/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var NameTextLabel: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBAction func SaveBtn(_ sender: UIButton) {
        var tempSavedName:[[String:Any]] = UserDefaults.standard.array(forKey: "myFriends") as! [[String:Any]]
        let newFriend:[String:Any]
        UserDefaults.standard.set(NameTextLabel.text, forKey: "Name")
        print(UserDefaults.standard.string(forKey: "Name")!)
    }
   
    var defaultName:String?
    var isEditingMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        if !isEditingMode {
            let defaultName = self.defaultName ?? "No Name"
            NameTextLabel.isUserInteractionEnabled = false
            saveBtn.isHidden = true
        }
        
        
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
