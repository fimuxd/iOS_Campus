//
//  ViewController.swift
//  DatePractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /****************************************************/
    //                 IBOutlet / 전역변수                 //
    /****************************************************/
    @IBOutlet weak var showSelectedTimeLabel: UILabel!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    var dateFormatter:DateFormatter = DateFormatter()
    
    
    /****************************************************/
    //                      IBAction                    //
    /****************************************************/
    @IBAction func datePicker(_ sender: UIDatePicker) {
    self.showSelectedTimeLabel.text = self.dateFormatter.string(from: sender.date)
    }
    
    
    /****************************************************/
    //                     LifeCycle                    //
    /****************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 a h시 m분"
        dateFormatter.locale = Locale(identifier: "KO_KR")
        datePickerOutlet.locale = Locale(identifier: "KO_KR")
        self.datePickerOutlet.date = Date()
        self.showSelectedTimeLabel.text = self.dateFormatter.string(from: datePickerOutlet.date)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

