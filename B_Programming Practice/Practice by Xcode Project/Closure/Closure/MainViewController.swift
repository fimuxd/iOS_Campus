//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit


//친구리스트를 보여주는 MainViewController

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /******************************************/
    //            IBOutlet | 전역변수           //
    /******************************************/
    @IBOutlet weak var segCtrlOutlet: UISegmentedControl!
    @IBOutlet weak var addBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredList:[Person] = DataFile.sharedData.friendsList
    
    /******************************************/
    //            IBAction | Methods          //
    /******************************************/
    
    @IBAction func segCtrol(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
        settingTable(selectedSegmentIndex: 0)
        }else if sender.selectedSegmentIndex == 1 {
            settingTable(selectedSegmentIndex: 1)
        }else{
            settingTable(selectedSegmentIndex: 2)
        }
        self.tableView.reloadData()
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        var nextViewController:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        nextViewController.saveOrEditBtnOutlet.setTitle("추가", for: .normal)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    /******************************************/
    //           TableView DataSource         //
    /******************************************/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filteredList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var nextViewController:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let name:String = filteredList[indexPath.row].name
        let age:String = String(filteredList[indexPath.row].age)
        let gender:String?
    
        if filteredList[indexPath.row].gender == Gender.Man {
            gender = "남성"
        }else{
            gender = "여성"
        }
        
        nextViewController.name = name
        nextViewController.age = age
        nextViewController.gender = gender!
        nextViewController.rowForIndexPath = indexPath.row
        
        nextViewController.saveOrEditBtnOutlet.setTitle("수정", for: .normal)
    
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func settingTable(selectedSegmentIndex:Int) {
        
        switch selectedSegmentIndex {
        case 0:
            self.filteredList = DataFile.sharedData.friendsList
            
        case 1:
            let manList = DataFile.sharedData.friendsList.filter({ (Person) -> Bool in
                Person.gender == FriendList.Gender.Man
            })
            
            self.filteredList = manList
        
//            self.tableView.reloadData()
        case 2:
            let womanList = DataFile.sharedData.friendsList.filter({ (Person) -> Bool in
                Person.gender == FriendList.Gender.Woman
            })
            
            self.filteredList = womanList
//            self.tableView.reloadData()
        default:
            print("error")
        }
    }
    

    
    /******************************************/
    //                Life Cycle              //
    /******************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filteredList = DataFile.sharedData.friendsList
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

