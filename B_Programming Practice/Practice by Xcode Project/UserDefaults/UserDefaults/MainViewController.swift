//
//  MainViewController.swift
//  UserDefaults
//
//  Created by Bo-Young PARK on 30/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var segueOnOff: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if segueOnOff.selectedSegmentIndex == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC:SecondViewController = segue.destination as! SecondViewController
        secondVC.data = "Bo-Young"
    }
    
    @IBAction func unwindSegue(unwindSegue:UIStoryboardSegue) {
        
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
