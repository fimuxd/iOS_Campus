//
//  ViewController.swift
//  SettingPair
//
//  Created by joe on 2017. 6. 21..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rowTitle:String?
    var settingCenter:SettingCenter = SettingCenter.init()
    
    @IBOutlet weak var tableView: UITableView!
    
    /*******************************************/
    //                TableView              //
    /*******************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCenter.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = settingCenter.cellType(forRowAt: indexPath)
     
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.textLabel?.text = settingCenter.cellTitle(forRowAt: indexPath)
            cell.detailTextLabel?.text = settingCenter.cellSubtitle(forRowAt: indexPath)
            cell.detailTextLabel?.textColor = .gray
            cell.selectionStyle = .none
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            cell.detailTextLabel?.text = settingCenter.cellSubtitle(forRowAt: indexPath)
            cell.textLabel?.text = settingCenter.cellTitle(forRowAt: indexPath)
            cell.detailTextLabel?.textColor = .gray
            cell.selectionStyle = .gray
            return cell
        case .Custom:
            let cell:CustomSwitchCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! CustomSwitchCell
            
            cell.selectionStyle = .none
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let nextViewController = segue.destination as! ViewController
        nextViewController.rowTitle = cell.textLabel?.text
    }

}

