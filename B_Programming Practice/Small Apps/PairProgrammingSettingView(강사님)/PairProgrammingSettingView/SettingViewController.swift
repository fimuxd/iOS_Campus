//
//  SettingViewController.swift
//  PairProgrammingSettingView
//
//  Created by youngmin joo on 2017. 6. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var settingData:TableData?
    
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        settingData = SettingCenter.sharedSetting.settingData
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = settingData?.sections {
            return sections.count
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let rows = settingData?.sections[section].rows {
            return rows.count
        }
        
        return 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //section이 불렸기 때문에 settingData가 있다고 여길수 있다.
        let rowData = settingData!.sections[indexPath.section].rows[indexPath.row]
        

        switch rowData.type {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! YMTableViewCell
            cell.indexPaht = indexPath
            cell.cellData = rowData
            
            if let subText = rowData.subText {
                cell.detailLb?.text = subText
            }else
            {
                cell.detailLb?.text = ""
            }
            
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! YMTableViewCell
            
            cell.indexPaht = indexPath
            cell.cellData = rowData
            cell.accessoryType = .disclosureIndicator
            if let subText = rowData.subText {
                cell.detailLb?.text = subText
            }else
            {
                cell.detailLb?.text = ""
            }
            
            
            return cell
            
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
            
            cell.selectionStyle = .none
            cell.cellData = rowData
            
                        
            return cell
        }

    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! YMTableViewCell
        
        if let nextData = cell.cellData?.nextData
        {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailSettingViewController") as! DetailSettingViewController
            nextVC.detailData = nextData
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }
    
}
