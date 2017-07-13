//
//  MainViewController.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit


//로그인 후 Main (Setting 버튼 있는 곳)

class MainViewController: UIViewController {

    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    @IBOutlet weak var menuButtonOutlet: UIButton!
    
    
    
    var currentUser:User?
    
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    @IBAction func menuButtonAction(_ sender: UIButton) {
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
