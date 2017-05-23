//
//  GreyViewController.swift
//  AppDelegateTezt
//
//  Created by Bo-Young PARK on 23/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class GreyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Grey VC: viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        print("Grey VC: loadView")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Grey VC: viewWillAppear: view가 화면에 보여지기 직전 준비")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Grey VC: viewWillLayOutSubviews: view 의 하위view들의 layout이 결정되기 직전")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Grey VC:viewDidLayoutSubviews: view의 하위 view들의 layout이 결정된 후")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Grey VC: viewDidAppear: view가 화면에 보여진 직후")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Grey VC: viewWillDisappear: view가 화면에 사라지기 직전")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Grey VC: viewDidDisappear: view가 화면에 사라진 후")
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
