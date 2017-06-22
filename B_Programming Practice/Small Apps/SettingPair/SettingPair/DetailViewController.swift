//
//  DetailViewController.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rowTitle:String?
    var settingCenter:SettingCenter = SettingCenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    /*******************************************/
    //                TableView              //
    /*******************************************/
    
    //-----Row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = settingCenter.cellType(forRowAt: indexPath)
        
        switch rowTitle! {
        case "Wi-Fi":
            let cell:CustomSwitchCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomSwitchCell
            cell.titleLabel.text = "Wi-Fi"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            return cell
        }
        
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return settingCenter.detailHeaderTitle(forSectionAt: section)
//    }
//    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return settingCenter.detailFooterTitle(forSectionAt: section)
//    }
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
