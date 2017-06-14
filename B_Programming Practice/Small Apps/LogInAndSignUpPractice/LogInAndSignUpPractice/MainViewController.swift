//
//  MainViewController.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//


/******************************************************************************/
//                  initial VC로써, App의 Main 을 나타내는 VC입니다.                 //
//                      1. LogIn이 되어있으면 바로 Main을 띄우고,                     //
//                      2. LogIn이 되어있지 않으면, LogIn VC를 띄운다.                //
//          3. LogIn 한 후에, LogOut Btn을 눌러서 LogIn VC로 이동할 수 있다.           //
/******************************************************************************/


import UIKit

class MainViewController: UIViewController {
    
    /******************************************************************************/
    //                                  전역변수                                     //
    /******************************************************************************/
    
    var isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
    
    
    /******************************************************************************/
    //                                 IBAction                                   //
    /******************************************************************************/
    @IBAction func returnLogInBtn(_ sender: UIButton) {
        setAlert()
    }
    
    
    /******************************************************************************/
    //                                 함수 모음                                     //
    /******************************************************************************/
    
    func setAlert() {
        let alert:UIAlertController = UIAlertController(title: "LOGOUT", message: "정말 로그아웃하시겠어요?", preferredStyle: .alert)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(alert:UIAlertAction) in self.isAuthentified = false; let viewController:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController;
            self.present(viewController, animated: true, completion: nil)})
        
        
        let cancelBtn:UIAlertAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    /******************************************************************************/
    //                                 LifeCycle                                  //
    /******************************************************************************/
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authentification.authentificationBool)
        
        super.viewDidAppear(animated)
        if !isAuthentified {
            
            let viewController:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            self.present(viewController, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
