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
    
    
    
    
    /***********************************************************************************/
    //                      자습_UserDefault & Present Modally 활용                       //
    /***********************************************************************************/

    //VC에서 받아온 값을 표시해줄 Label
    @IBOutlet weak var wecomeLabel: UILabel!
    
    //ViewController에서 Segua로 넘긴 data값(UserDefault로 입력했던 값)을 받아올 변수 설정
    var data1:String?
    var data2:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lastName = data1, let firstName = data2 {
        
        wecomeLabel.text = "\(lastName)" + "\(firstName)" + "님, 안녕하세요"
        }

    }

    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if segueOnOff.selectedSegmentIndex == 0 {
            return true
        }
        else {
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
