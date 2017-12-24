//
//  MainTabBarViewController.swift
//  
//
//  Created by Kang Seongchan on 2017. 7. 7..
//
//

import UIKit

class MainTabBarViewController: UITabBarController {

//    @IBOutlet weak var MainTabbar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
        
//        MainTabbar.selectedItem = tabBar.items![1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
