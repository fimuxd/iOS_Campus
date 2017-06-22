//
//  ViewController.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settingCenter:SettingCenter = SettingCenter.init()
    
    /*******************************************/
    //                TableView              //
    /*******************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCenter.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = settingCenter.cellType(forRowAt: indexPath)
        let cellTitle = settingCenter.cellTitle(forRowAt: indexPath)
     
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = settingCenter.cellTitle(forRowAt: indexPath)
            cell.detailTextLabel?.text = settingCenter.cellSubtitle(forRowAt: indexPath)
            cell.detailTextLabel?.textColor = .gray
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.detailTextLabel?.text = settingCenter.cellSubtitle(forRowAt: indexPath)
            cell.textLabel?.text = settingCenter.cellTitle(forRowAt: indexPath)
            cell.detailTextLabel?.textColor = .gray
            return cell
        case .Custom:
            let cell:CustomSwitchCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! CustomSwitchCell
            cell.titleLabel.text = cellTitle
            return cell
        case .NoType:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            return cell
        }
    
    }
    
    
    
    /*******************************************/
    //                Life Cycle               //
    /*******************************************/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

