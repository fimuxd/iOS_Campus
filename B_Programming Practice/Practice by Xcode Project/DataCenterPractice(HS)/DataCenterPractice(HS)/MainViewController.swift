//
//  MainViewController.swift
//  DataCenterPractice(HS)
//
//  Created by Bo-Young PARK on 15/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.indexPath = indexPath.row
    }
    
    
    
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
