//
//  CustomNibTableViewController.swift
//  TableViewNibPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class CustomNibTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /*********************************************/
    //              IBOutlet | 전역변수             //
    /*********************************************/
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    /*********************************************/
    //             IBAction | Methods            //
    /*********************************************/
    
    //-----TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomNibTableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomNibTableViewCell.reuseIdentifier, for: indexPath) as! CustomNibTableViewCell
        
        cell.titleTextLabel.text = "큰텍스트"
        cell.subTitleTextLabel.text = "작고 긴 텍스트"
        cell.squareImageView.image = #imageLiteral(resourceName: "CoWorkImage")
        cell.cellSwitchAcc.addTarget(self, action: #selector(switchValueChanged(_:)), for: UIControlEvents.valueChanged)
        //UIControlEvents.valueChanged가 일어나면 target에게 Action 시켜: self.switchValueChanged(cell.cellSwitchAcc)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CustomNibTableViewCell.cellHeight)
    }
    
    func switchValueChanged(_ sender:UISwitch) {
        print("그렇다고 한다", sender.isOn)
        self.tableView.reloadData()
    }
    
    
    
    /*********************************************/
    //                  LifeCycle                //
    /*********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: "CustomNibTableViewCell", bundle: nil), forCellReuseIdentifier: CustomNibTableViewCell.reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
