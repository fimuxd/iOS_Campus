//
//  ViewController.swift
//  UIGestureRecorgnizerPractice
//
//  Created by Bo-Young PARK on 29/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    /******************************************/
    //            IBOutlet | 전역변수           //
    /******************************************/
    
    @IBOutlet weak var tapCountLabel: UILabel!
    @IBOutlet weak var cgPointLabel: UILabel!
    @IBOutlet weak var pickSquareView: UIView!
    
    var tappedCount = 0
    
    /******************************************/
    //            IBAction | Method           //
    /******************************************/
    
    @IBAction func tapGestureRecognizerTest(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: view)
        
        self.cgPointLabel.text = "(\(Int(location.x)),\(Int(location.y)))"
        
        if sender.state == .failed {
            tappedCount = 0
            print("ended")
        }
        
        tappedCount += 1
        self.tapCountLabel.text = String(tappedCount)
    

        UIView.animate(withDuration: 3, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { 
            self.pickSquareView.transform = CATransform3DMakeScale(3, 3, 1)
        }, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

