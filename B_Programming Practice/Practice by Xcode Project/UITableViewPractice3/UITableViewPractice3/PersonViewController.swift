//
//  PersonViewController.swift
//  UITableViewPractice3
//
//  Created by Bo-Young PARK on 7/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    //Label 연결
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    //data 받을 변수 설정
    var lastName:String?
    var firstName:String?
    var company:String?
    var phone:String?
    var email:String?
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lastName = self.lastName ?? "No"
        let firstName = self.firstName ?? "Name"
        let company = self.company ?? ""
        let phone = self.phone ?? ""
        let email = self.email ?? ""
        
        self.lastNameLabel.text = lastName
        self.firstNameLabel.text = firstName
        self.companyLabel.text = company
        self.phoneLabel.text = phone
        self.emailLabel.text = email
        
        self.title = lastName + " " + firstName
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
