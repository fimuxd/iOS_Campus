//
//  SecondViewController.swift
//  NotificationPractice
//
//  Created by Bo-Young PARK on 22/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    
    @IBOutlet weak var testSwitch: UISwitch!
    @IBAction func changeSwitcher(_ sender: UISwitch) {
        
        if sender.isOn{
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불켜져있어")
            UserDefaults.standard.set(sender.value(forKey: "On"), forKey: "스위치불")
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불껐당")
            UserDefaults.standard.set(sender.value(forKey: "Off"), forKey: "스위치불")
        }
        
        
    }
    
    @IBAction func tellMeTheFactBtn(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name("TellMeBtn"), object: "내가 아는건 내가 멍청하다는 사실뿐입니당")
        
    }
    
    @IBAction func segControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "첫번째 눌렀구낭")
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "두번째 눌렀넹ㅋ")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
