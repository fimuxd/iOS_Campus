//
//  MainViewController.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
     
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        
        super.viewDidAppear(animated)
        if !isAuthentified {
            self.performSegue(withIdentifier: "LoginViewSegue", sender: self)
        }
        
    }
    
    @IBAction func returnLogInBtn(_ sender: UIButton) {
        
        isAuthentified = false
        self.performSegue(withIdentifier: "LoginViewSegue", sender: self)
        
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue) {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
