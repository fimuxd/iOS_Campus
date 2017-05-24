//
//  ViewController.swift
//  CollatzConjecture
//
//  Created by Bo-Young PARK on 24/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //숫자 입력 텍스트 레이블
    @IBOutlet weak var inputTextField: UITextField!
    
    //결과값 출력 레이블
    @IBOutlet weak var resultLabel: UILabel!
    
    func doCollatzConjection(with parameter:Int) -> Int {
        var number:Int = parameter
        var count:Int = 0
        
        while number != 1
        {
            if number%2 == 0 {
                number = number/2
            }
            else if number%2 != 0 {
                number = (number * 3) + 1
            }
            count += 1
        }
        self.resultLabel.text = String(count)
        return count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //실행 버튼
    @IBAction func startBtn(_ sender: UIButton) {
        var number:Int? = Int(inputTextField.text!)
        
        if let number = number {
            self.doCollatzConjection(with: number)
            
        }
        else {
            self.resultLabel.text = "숫자를 입력하세요"
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

