//
//  ViewController.swift
//  HarshadNumberAlgorithm
//
//  Created by Bo-Young PARK on 13/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func btn(_ sender: UIButton) {
        isHarshadNumber(num: Int(textField.text!)!)
        textField.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(exponentiation(number: 10, time: 2))
        //        print(exponentiation(number: 10, time: 3))
        //        makePlaceNumbers(num: 180)
        //        makePlaceNumbers(num: 200)
        
        statusLabel.text = "숫자를 입력하세요. (두자리수 이상)"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*********************************************************************/
    //                          Harshad Number                           //
    //                그 숫자가 각 자릿수의 합으로 나누어 떨어지는 수                //
    //                예) 18 -> Harshad Number. 18/(1+8) = 2              //
    /*********************************************************************/
    
    //전역변수
    var placeNumbers:[Int] = []
    
    
    
    func isHarshadNumber(num:Int) -> Bool {
        let inputNumber:Int = num
        let numStrCount:Int = String(inputNumber).characters.count
        if numStrCount > 1 {
            makePlaceNumbers(num: num)
            var sumOfIndex:Int = 0
            
            for index in 0...placeNumbers.count-1 {
                sumOfIndex += placeNumbers[index]
            }
//            print("\(sumOfIndex)")
            
            if num%sumOfIndex == 0 {
                statusLabel.text = "\(num)은 하샤드넘버ㅇㅇ"
                placeNumbers = []
                return true
            }else{
                statusLabel.text = "\(num)은 하샤드아님ㄴㄴ"
                placeNumbers = []
                return false
            }
        }else{
            statusLabel.text = "두자리수 이상을 입력하세요"
            return false
        }
    }


    
    func makePlaceNumbers(num:Int) {
        
        var inputNumber:Int = num
        let numStrCount:Int = String(inputNumber).characters.count
        //        let placeNumber:Int = inputNumber / exponentiation(number: 10, time: numStrCount)
        
        
        //            for _ in 1...numStrCount {
        //                placeNumbers.append(inputNumber / exponentiation(number: 10, time: numStrCount))
        //                placeNumbers.append(inputNumber % exponentiation(number: 10, time: numStrCount) / exponentiation(number: 10, time: numStrCount-1))
        //                print(placeNumbers)
        //            }
        
        //            if numStrCount == 1 {
        //                placeNumbers.append(inputNumber % exponentiation(number: 10, time: numStrCount)
        //            }else{
        //                placeNumbers.append(inputNumber / exponentiation(number: 10, time: numStrCount-1)
        
        
        //        }
        
        for _ in 1...numStrCount {
            placeNumbers.append(inputNumber%10)
            inputNumber = inputNumber/10
        }
        print(placeNumbers)
    }


    
    func exponentiation(number:Int, time:Int) -> Int {
        var result:Int = 1
        
        for _ in 1..<time{
            result *= number
        }
        
        return result
        
    }
    


}


