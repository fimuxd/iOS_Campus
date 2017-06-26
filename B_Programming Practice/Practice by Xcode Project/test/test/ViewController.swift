//
//  ViewController.swift
//  test
//
//  Created by Bo-Young PARK on 26/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /***************************************/
    //               전역변수                //
    /***************************************/
    var timer:Timer?
    var dateFormatter:DateFormatter = DateFormatter()
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countDownTimerOutlet: UIDatePicker!
    @IBOutlet weak var timerActOutlet: UIButton!
    
    
    /***************************************/
    //               Method                //
    /***************************************/
    
    func startTimer(for minute:Int) {
        var seconds:Int = minute
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) in
            
            seconds -= 1
            self.timerLabel.text = String(seconds)
        
            if seconds == 0 {
                timer.invalidate()
                self.timerLabel.text = "0"
                self.timerActOutlet.setTitle("Start", for: .normal)
            }
        })
        
        self.timer?.fire()
    }
    
    
    
    @IBAction func countDownTimer(_ sender: UIDatePicker) {
        self.timerLabel.text = String(sender.countDownDuration)
    }
    
    @IBAction func timerActionBtn(_ sender: UIButton) {
        
        if self.timer?.isValid == true{
            self.timerActOutlet.setTitle("Restart", for: .normal)
            self.timer?.invalidate()
        }else if self.timerActOutlet.titleLabel?.text == "Restart" {
            startTimer(for: Int(timerLabel.text!)!)
        }else{
            startTimer(for: Int(self.countDownTimerOutlet.countDownDuration))
            self.timerActOutlet.setTitle("Pause", for: .normal)
        }
    }
    

    @IBAction func resetActBtn(_ sender: UIButton) {
        self.timerLabel.text = "0"
        self.timerActOutlet.setTitle("Start", for: .normal)
    }
    
    
    /***************************************/
    //             Life Cycle              //
    /***************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.dateFormatter.dateFormat = "mm:ss"
//        self.timerLabel.text = self.dateFormatter.string(from: countDownTimerOutlet.date)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

}

