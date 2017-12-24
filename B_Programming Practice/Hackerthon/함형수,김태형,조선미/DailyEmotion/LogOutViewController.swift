//
//  LogOutViewController.swift
//  DailyEmotion
//
//  Created by Hyoungsu Ham on 2017. 7. 9..
//  Copyright © 2017년 joe. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonTouched(_ sender: UIButton) {
        
        DataCenter.standard.saveToDoc()
        let logInVC: LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.present(logInVC, animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "logInStatus")
        
        self.tabBarController?.selectedIndex = 0
        
    }

}
