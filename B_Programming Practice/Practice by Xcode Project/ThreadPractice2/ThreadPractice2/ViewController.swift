//
//  ViewController.swift
//  ThreadPractice2
//
//  Created by Bo-Young PARK on 14/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //******************************************//
    //            IBOutlet | 전역변수              //
    //******************************************//
    @IBOutlet weak var tableView: UITableView!
    
    let imageUrl:String = "https://images.unsplash.com/photo-1499950348701-341ad3fd90a1?dpr=2&auto=format&fit=crop&w=1500&h=838&q=80&cs=tinysrgb&crop="
    
    var images:[UIImage] = []
    
    
    //******************************************//
    //            IBAction | 함수영역              //
    //******************************************//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        cell.set(title: "cell index: \(indexPath.row)", imageUrl: self.imageUrl)
        
        return cell
    }
    
    
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

