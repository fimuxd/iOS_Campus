//
//  MainViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by Bo-Young PARK on 13/7/2017.
//  Copyright © 2017 Jongchan Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    @IBOutlet weak var tableView: UITableView!
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomDynamicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TwitCell", for: indexPath) as! CustomDynamicTableViewCell
            
        cell.nameLabel.text = DataCenter.shared.dataArray[indexPath.row].userName
        cell.twitterIDLabel.text = DataCenter.shared.dataArray[indexPath.row].userId
        cell.bodyTextLabel.text = DataCenter.shared.dataArray[indexPath.row].bodyText
        
        cell.profileButtonOutlet.setImage(UIImage(named: DataCenter.shared.dataArray[indexPath.row].userPhotoUrl), for: .normal)
        
        if let realImageUrl = DataCenter.shared.dataArray[indexPath.row].imageUrl {
            cell.inputImageButtonOutlet.setImage(UIImage(named: realImageUrl), for: .normal)
        }
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customDynamicTableViewCell:UINib = UINib(nibName: "CustomDynamicTableViewCell", bundle: nil)
        tableView.register(customDynamicTableViewCell, forCellReuseIdentifier: "TwitCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
