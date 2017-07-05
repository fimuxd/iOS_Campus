//
//  MainViewController.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !self.isAuthentified {
            let navigationController:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "ToLogInViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    /****************************************/
    //           IBOutlet | 전역변수           //
    /****************************************/
    @IBOutlet weak var logOutBtnOutlet: UIButton!

    var isAuthentified:Bool = UserDefaults.standard.bool(forKey: "authentification")
    
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    @IBAction func logOutBtnAction(_ sender: UIButton) {
        logOutConfirmAlert()
    }
    
    func logOutConfirmAlert() {
        let alert:UIAlertController = UIAlertController(title: "로그아웃", message: "정말 로그아웃 하시겠습니까?", preferredStyle: .alert)
        let confirmBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
            self.isAuthentified = false
            
            let navigationController:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "ToLogInViewController") as! UINavigationController
            self.present(navigationController, animated: true, completion: nil)
            
        }
        
        let cancelBtn:UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirmBtn)
        alert.addAction(cancelBtn)
        alert.present(alert, animated: true, completion: nil)
    }
    
    
}
