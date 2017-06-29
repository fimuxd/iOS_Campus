//
//  DetailSettingViewController.swift
//  PairProgrammingSettingView
//
//  Created by youngmin joo on 2017. 6. 25..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class DetailSettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    
    var detailData:TableData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = detailData?.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let rows = detailData?.sections[section].rows {
            return rows.count
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //section이 불렸기 때문에 settingData가 있다고 여길수 있다.
        let rowData = detailData!.sections[indexPath.section].rows[indexPath.row]
        
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


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
        if let section = detailData?.sections[section],
            let headerTitle =  section.header
        {
            return headerTitle
        }
        return nil
    }

    
}
