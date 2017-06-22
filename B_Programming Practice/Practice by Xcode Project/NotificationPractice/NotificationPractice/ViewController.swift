//
//  ViewController.swift
//  NotificationPractice
//
//  Created by Bo-Young PARK on 22/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tellMeLabel: UILabel!
    @IBOutlet weak var whichSegueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 해당 ViewController가 Observer가 된다는 것
        // Observer 인 VC상의 label에게 그 것을 알려주기 위해서 addObserver에서 해당 함수(callNoti)내부에 실행할 액션을 더한다.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callNoti(_:)), name: Notification.Name("changeSwitcher"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.tellMeNoti(_:)), name: Notification.Name("TellMeBtn"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.whichSegueNumber(_:)), name: Notification.Name("SegueNumber"), object: nil)
    }
    
    func callNoti(_ sender:Notification) {
        statusLabel.text = sender.object as? String
    }
    
    func tellMeNoti(_ sender:Notification) {
        tellMeLabel.text = sender.object as? String
    }
    
    func whichSegueNumber(_ sender:Notification) {
        whichSegueLabel.text = sender.object as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        //최초의 ViewController는 보통 한번만 불리지만, 메모리 워닝이 나면 한번 더 불릴 수가 있다.
        //그럴때를 대비해서 생성된 Observer들을 지워주는 것이 좋다.
        
        NotificationCenter.default.removeObserver(self)
    }

}

