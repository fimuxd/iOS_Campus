//
//  ViewController.swift
//  PracticeSwift
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //1. 홀짝 알려주는 앱만들기 위한 변수 설정
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //2. 자기 자신과 1을 제외한 약수들의 합을 출력해주는 앱 만들기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func runButtonTouched(_ sender: UIButton) {
        //텍스트 필드에 입력하는 숫자를 가져 올 것이다. 
        //하지만 숫자가 없을 수도 있고, 글씨를 쓸 수도 있으므로 !(옵셔널) 해준 것
        //따라서 텍스트 필드에는 숫자만 적여야 하는데, 숫자를 적지 않고 글자를 넣으면 crash 발생한다.
        let numb:Int = Int(self.inputTextField.text!)!
        
        self.sumDivisor(inputNumber: numb)
        
    }
    // 홀짝 알려주는 함수
    func isEven(number num: Int) {
        if num % 2 == 0 {
            self.resultLabel.text = "짝수입니다"
        }
        else {
            self.resultLabel.text = "홀수입니다."
        }
    }
    
    // 약수 함수
    func sumDivisor(inputNumber:Int) {
        var divisors:[Int] = []
        var sumNumber:Int = 0
        
        for number in 1..<inputNumber {
            if inputNumber%number == 0 {
                divisors.append(number)
            }
        
        }
        for index in 1..<divisors.count {
            sumNumber += divisors[index]
        }
        self.resultLabel.text = "결과는 \(sumNumber) 입니다"
    }
    
}





