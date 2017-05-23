//
//  ViewController.swift
//  AppDelegateTezt
//
//  Created by Bo-Young PARK on 23/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Red VC: ViewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        print("Red VC: loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Red VC: viewWillAppear: view가 화면에 보여지기 직전 준비")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Red VC: viewWillLayOutSubviews: view 의 하위view들의 layout이 결정되기 직전")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Red VC:viewDidLayoutSubviews: view의 하위 view들의 layout이 결정된 후")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Red VC: viewDidAppear: view가 화면에 보여진 직후")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Red VC: viewWillDisappear: view가 화면에 사라지기 직전")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Red VC: viewDidDisappear: view가 화면에 사라진 후")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

