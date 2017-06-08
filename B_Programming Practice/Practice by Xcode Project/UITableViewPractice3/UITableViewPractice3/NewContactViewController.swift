//
//  NewContactViewController.swift
//  UITableViewPractice3
//
//  Created by Bo-Young PARK on 7/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    //기본 Label 및 Button Outlet 연결
    @IBOutlet weak var doneBtnOutlet: UIButton!
    @IBOutlet weak var lastNameTextLabel: UITextField!
    @IBOutlet weak var firstNameTextLabel: UITextField!
    @IBOutlet weak var companyTextLabel: UITextField!
    @IBOutlet weak var addPhoneTextLabel: UITextField!
    @IBOutlet weak var addEmailTextLabel: UITextField!
    

    
    //기본 Button Action 생성
    @IBAction func doneBtn(_ sender: UIButton) {
        
        var newFriendArray = UserDefaults.standard.array(forKey: "newFriendArray") as? [[String : String]]
        
        let lastName:String = lastNameTextLabel.text!
        let firstName:String = firstNameTextLabel.text!
        let company:String = companyTextLabel.text!
        let phone:String = addPhoneTextLabel.text!
        let email:String = addEmailTextLabel.text!
        
        let newPersonDic:[String:String] = ["Lastname":lastName,"Firstname":firstName,"Company":company,"Phone":phone,"Email":email]
        
        if newFriendArray == nil {
            newFriendArray = [["Lastname":lastName,"Firstname":firstName,"Company":company,"Phone":phone,"Email":email]]
        }
        else {
            newFriendArray!.append(newPersonDic)
        }
        
        UserDefaults.standard.set(newFriendArray,forKey: "newFriendArray")
        
        
    }
    
    @IBAction func addPhotoBtn(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
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
