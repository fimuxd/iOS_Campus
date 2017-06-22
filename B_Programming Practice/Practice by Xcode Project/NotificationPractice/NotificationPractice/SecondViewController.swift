//
//  SecondViewController.swift
//  NotificationPractice
//
//  Created by Bo-Young PARK on 22/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    
    
    /**************************************************/
    //                IBOutlet | 전역변수               //
    /**************************************************/
    @IBOutlet weak var testSwitch: UISwitch!
    @IBOutlet weak var testSegCtrlOutlet: UISegmentedControl!
    
    
    /**************************************************/
    //                IBAction | Methods               //
    /**************************************************/
    
    //-----스위치 액션
    @IBAction func changeSwitcher(_ sender: UISwitch) {
        
        if sender.isOn{
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불켜져있어")
            UserDefaults.standard.set(true, forKey: "스위치불")
            
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불껐당")
            UserDefaults.standard.set(false, forKey: "스위치불")
        }
   
    }
    
    //-----버튼
    @IBAction func tellMeTheFactBtn(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("TellMeBtn"), object: "내가 아는건 내가 멍청하다는 사실뿐입니당")
    }
    
    //-----SegmentedControl
    @IBAction func segControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "첫번째 눌렀구낭")
            UserDefaults.standard.set(1, forKey: "세그컨트롤")
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "두번째 눌렀넹ㅋ")
            UserDefaults.standard.set(2, forKey: "세그컨트롤")
        }
    }
    
    //-----스위치 온오프 상태 기억
    func switcherAction() {
        let switcherStatus:Bool = UserDefaults.standard.bool(forKey: "스위치불")
        
        if switcherStatus == false {
            self.testSwitch.setOn(false, animated: true)
        }else{
            self.testSwitch.setOn(true, animated: true)
        }
    }
    
    //-----SegmentControl 상태 기억
    func segControlStatus() {
        let segCtrlStatus = UserDefaults.standard.double(forKey: "세그컨트롤")
        
        if segCtrlStatus == 2 {
            self.testSegCtrlOutlet.selectedSegmentIndex = 1
        }else{
            self.testSegCtrlOutlet.selectedSegmentIndex = 0
        }
        
    }
    
    /**************************************************/
    //                 View Life Cycle                //
    /**************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        switcherAction()
        segControlStatus()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //-----나갈 때 Noti 지우고 나가 ^^
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
