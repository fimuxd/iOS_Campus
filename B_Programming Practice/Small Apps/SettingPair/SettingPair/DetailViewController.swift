//
//  DetailViewController.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settingCenter:SettingCenter = SettingCenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    /*******************************************/
    //                TableView              //
    /*******************************************/
    
    //-----Row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCenter.numberOfDetailRow(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = settingCenter.cellType(forRowAt: indexPath)
        
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
            cell.titleLabel.text = settingCenter.detailCellTitle(forRowAt: indexPath)
            return cell
        case .NoType:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingCenter.detailHeaderTitle(forSectionAt: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return settingCenter.detailFooterTitle(forSectionAt: section)
    }
    
    
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
