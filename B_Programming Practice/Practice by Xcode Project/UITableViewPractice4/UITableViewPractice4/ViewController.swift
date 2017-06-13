//
//  ViewController.swift
//  UITableViewPractice4
//
//  Created by Bo-Young PARK on 13/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.bounces = false
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionData.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let contentCell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! CustomTableViewCell
            contentCell.contentImage?.image = UIImage(named: "\(indexPath.section)-\(indexPath.row).png")
            
            return contentCell
            
        case 1...SectionData.sectionTitles.count:
            let listCell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! CustomTableViewCell
            
            listCell.image1?.image = UIImage(named: "\(indexPath.section)-\(listCell.image1!.tag).png")
            listCell.image2?.image = UIImage(named: "\(indexPath.section)-\(listCell.image2!.tag).png")
            listCell.image3?.image = UIImage(named: "\(indexPath.section)-\(listCell.image3!.tag).png")
            listCell.image4?.image = UIImage(named: "\(indexPath.section)-\(listCell.image4!.tag).png")
            listCell.image5?.image = UIImage(named: "\(indexPath.section)-\(listCell.image5!.tag).png")
            
            print("\(indexPath.section)-\(listCell.image1!.tag).png")
            return listCell
        
        default:
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "")
            return defaultCell!
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionData.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .black
        view.alpha = 1
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .lightGray
    }
    
    
    
}

