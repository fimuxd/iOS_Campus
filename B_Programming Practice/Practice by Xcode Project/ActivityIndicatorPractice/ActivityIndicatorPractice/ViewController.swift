//
//  ViewController.swift
//  ActivityIndicatorPractice
//
//  Created by Bo-Young PARK on 19/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    /*********************************************************/
    //                        IB Outlet                      //
    /*********************************************************/
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    /*********************************************************/
    //                        IB Action                      //
    /*********************************************************/
    
    @IBAction func slider(_ sender: UISlider) {
        self.sliderLabel.text = String(sender.value)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn {
            self.switchLabel.text = "True"
        }else {
            self.switchLabel.text = "False"
        }
    }
    
    @IBAction func runIndicator(_ sender: UIButton) {
        if activityIndicator.isAnimating{
            activityIndicator.stopAnimating()
        }else{
            activityIndicator.startAnimating()
        }
    }

    
    /*********************************************************/
    //                        Life Cycle                      //
    /*********************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderLabel.text = "슬라이더가 움직이면 여기에 값이 나옵니다."
        self.sliderOutlet.isContinuous = false
        self.sliderOutlet.minimumTrackTintColor = .blue
        self.sliderOutlet.thumbTintColor = .lightGray
        self.switchLabel.text = "스위치를 조절하면 여기에 값이 나옵니다."
        self.switchOutlet.onTintColor = .blue
        self.activityIndicator.color = .blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

