//
//  AlertViewController.swift
//  HackertonProject
//
//  Created by 이재성 on 2017. 7. 6..
//  Copyright © 2017년 jaeseong. All rights reserved.
//

import UIKit
//import SCLAlertView

class AlertViewController: UIViewController {

    @IBAction func sss(_ sender: UIButton) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "닉네임등록", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "닉네임을 입력하세요"
        }
        
        let okBtn = UIAlertAction(title: "확인", style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                UserDefaults.standard.set(title, forKey: "nickName")
                
            }
        }
        let cancelBtn = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        
        self.present(alert, animated: true, completion: nil)
//        //SCLAlertView().showInfo("아아", subTitle: "가가")
//        SCLAlertView().showTitle(
//            "Congratulations", // Title of view
//            subTitle: "Operation successfully completed.", // String of view
//            duration: 2.0, // Duration to show before closing automatically, default: 0.0
//            completeText: "Done", // Optional button value, default: ""
//            style: .success, // Styles - see below.
//            colorStyle: 0xA429FF,
//            colorTextButton: 0xFFFFFF)
    }
}
