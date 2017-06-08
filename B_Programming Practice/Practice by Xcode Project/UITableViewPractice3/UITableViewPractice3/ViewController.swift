//
//  ViewController.swift
//  UITableViewPractice3
//
//  Created by Bo-Young PARK on 7/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //UserDefault 변수 설정
        friendList = UserDefaults.standard.array(forKey: "newFriendArray") as? [[String : String]] ?? []
        
        tableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    //UserDefault 변수 설정
    var friendList:[[String:String]] = UserDefaults.standard.array(forKey: "newFriendArray") as! [[String : String]]? ?? []

    
    //일반 VC에서 TableView 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friends Name Title Cell", for: indexPath)
        
        //UserDefault 변수 설정
        var friendList:[[String:String]] = UserDefaults.standard.array(forKey: "newFriendArray") as! [[String : String]]? ?? []
        
        var personInfoDic:[String:String] = friendList[indexPath.row]
        let name:String = (personInfoDic["Lastname"]! + " " + personInfoDic["Firstname"]!)
        let company:String = personInfoDic["Company"]!
        
        cell.textLabel?.text = name ?? "Please input new contact"
        cell.detailTextLabel?.text = company ?? "defualt"
        
        return cell
    }
    
    //기존 contact 정보 띄우도록 cell 선택했을 때 작동할 함수 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Cell선택후 다시 되돌아 왔을 때 선택표시(회색) 없애는 것
        tableView.deselectRow(at: indexPath, animated: true)
        
        var nextViewController:PersonViewController = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        
        var personInfoDic:[String:String] = friendList[indexPath.row]
        let lastName:String = personInfoDic["Lastname"]!
        let firstName:String = personInfoDic["Firstname"]!
        let company:String = personInfoDic["Company"]!
        let phone:String = personInfoDic["Phone"]!
        let email:String = personInfoDic["Email"]!
        
        nextViewController.lastName = lastName
        nextViewController.firstName = firstName
        nextViewController.company = company
        nextViewController.phone = phone
        nextViewController.email = email
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
   
    
    //New Contact에서 Unwind Segue목적
    @IBAction func a(b:UIStoryboardSegue) {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

