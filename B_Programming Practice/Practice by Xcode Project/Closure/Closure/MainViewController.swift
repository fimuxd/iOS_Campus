//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit


//친구리스트를 보여주는 MainViewController

class MainViewController: UIViewController {


    /******************************************/
    //            IBOutlet | 전역변수           //
    /******************************************/
    @IBOutlet weak var segCtrlOutlet: UISegmentedControl!
    @IBOutlet weak var addBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    /******************************************/
    //            IBAction | Methods          //
    /******************************************/
    
    @IBAction func segCtrol(_ sender: UISegmentedControl) {
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
    }
    
    
    
    
    /******************************************/
    //                Life Cycle              //
    /******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View가 뜰 때 번들을 가져온다
        let mainBundle = Bundle.main
        
        //해당 리소스의 위치와 타입을 적어서 path를 지정하게 한다
        if let filePath = mainBundle.path(forResource: "FriendsData", ofType: "plist"),
            let array = NSArray(contentsOfFile: filePath) as? [Any] {
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

