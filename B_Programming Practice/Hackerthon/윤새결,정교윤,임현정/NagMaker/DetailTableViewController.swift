//
//  DetailTableViewController.swift
//  NagMaker
//
//  Created by HyunJomi on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedItem: NagData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        titleLabel.text = selectedItem?.location
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedItem?.nagList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableviewCell", for: indexPath)
        
        cell.textLabel?.text = selectedItem?.nagList[indexPath.row].nagTitle
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "timerSegue"{
            
            let vc = segue.destination as! TimerViewController
             
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let selectedNagItem = selectedItem?.nagList[indexPath.row]
            vc.nagData = selectedNagItem
        }
        else if segue.identifier == "addSegue"{
         
            let addVC = segue.destination as! AddAndEditViewController
            
            addVC.isEditMode = false
        }
    }
}
