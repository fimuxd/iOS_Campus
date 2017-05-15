//
//  ViewController.swift
//  Calculator Practice
//
//  Created by Bo-Young PARK on 10/5/2017.
//  Copyright © 2017 Bo-Young Park, Byron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    
    // 내부적으로 돌아가는 변수들 설정
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    
    // 외부 디스플레이에 보이는 변수 설정 (실제 계산과 디스플레이를 분리)
    var displayNumber:String = "0"
    
    ////////////////////////View Life Cycle////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ////////////////////////View Action////////////////////////
    
    @IBAction func ClickBtn(_ sender: UIButton) {
        print("GT")
    }

    @IBAction func ClickBtnMP(_ sender: UIButton) {
        print("M+")
    }
  
    @IBAction func ClickBtnMM(_ sender: UIButton) {
        print("M-")
    }
    
    @IBAction func ClickBtnMR(_ sender: UIButton) {
        print("MR")
    }
    
    @IBAction func ClickBtnMC(_ sender: UIButton) {
        print("MC")
    }
    
    @IBAction func ClickBtnOF(_ sender: UIButton) {
        print("OFF")
    }
    
    @IBAction func ClickBtnPC(_ sender: UIButton) {
        print("%")
        
        tempOperation = "/100"
        displayNumber = "0"
        
        func percent(firstNum:Int) -> Int
        {
            return firstNum / 100
        }
    }
        //Percent(%) 함수
    func percent(firstNum:Int) -> Int
        {
        return firstNum / 100
        }
    
    @IBAction func ClickBtnPM(_ sender: UIButton) {
        print("±")
        
        tempOperation = "+-"
        displayNumber = "0"
        
        func plusMinus(firstNum:Int) -> Int
        {
            return firstNum * -1
        }
        

    }
    
    @IBAction func ClickBtnRO(_ sender: UIButton) {
        print("√")
    }
    
    
    // 나누기 버튼 액션
    @IBAction func ClickBtnDV(_ sender: UIButton) {
        print("÷")
        
        tempOperation = "/"
        displayNumber = "0"
    }
        //나누기 함수
        func devide(firstNum:Int, secondNum:Int) -> Int
        {
            return firstNum / secondNum
        }
    
    // 곱하기 버튼 액션
    @IBAction func ClickBtnBy(_ sender: UIButton) {
        print("X")
        tempOperation = "*"
        displayNumber = "0"
    }
        //곱하기 함수
        func by(firstNum:Int, secondNum:Int) -> Int
        {
            return firstNum * secondNum
        }
    
    //빼기 버튼 액션
    @IBAction func ClickBtnMN(_ sender: UIButton) {
        print("ㅡ")
        tempOperation = "-"
        displayNumber = "0"
    }
        //빼기 함수
        func minus(firstNum:Int, secondNum:Int) -> Int
        {
            return firstNum - secondNum
        }

    //더하기(+) 버튼 액션
    @IBAction func ClickBtnPL(_ sender: UIButton) {
        print("+")
        tempOperation = "+"
        displayNumber = "0"
    }
        //더하기 함수
        func plus(firstNum:Int, secondNum:Int) -> Int
        {
            return firstNum + secondNum
        }
    
    
    //Equal 버튼 액션
    @IBAction func ClickBtnEQ(_ sender: UIButton) {
        print("=")
        
        var resultValue:Int = 0
        switch tempOperation
        {
        case "+":
            resultValue = plus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "-":
            resultValue = minus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "*":
            resultValue = by(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "/":
            resultValue = devide(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "/100":
            resultValue = percent(firstNum: tempFirstNum)
        default:
            resultValue = 0
        }
        displayLabel.text = "\(resultValue)"
        
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        
    }
    
    @IBAction func ClickBtnAC(_ sender: UIButton) {
        print("AC")
        //AC 버튼 액션 (눌렀을 때 "0" 이 디스플레이 되게)
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        
        displayLabel.text = "0"

    }
    
    @IBAction func ClickBtnCC(_ sender: UIButton) {
        print("C")
    }
    
    @IBAction func ClickBtnCE(_ sender: UIButton) {
        print("CE")
    }
    
    @IBAction func ClickBtnON(_ sender: UIButton) {
        print("ON")
    }
    
    @IBAction func ClickBtn0(_ sender: UIButton) {
        print("0")
        if displayNumber == "0"
        {
            displayNumber = "0"
        }
        else
        {
            displayNumber += "0"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    
    @IBAction func ClickBtn00(_ sender: UIButton) {
        print("00")
        if displayNumber == "0"
        {
            displayNumber = "0"
        }
        else
        {
            displayNumber += "00"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }

    
    @IBAction func ClickBtnDO(_ sender: UIButton) {
        print(".")
        displayLabel.text = "."
    }
    
    @IBAction func ClickBtn1(_ sender: UIButton) {
        print("1")
        
        //버튼클릭시 디스플레이 변경
        if displayNumber == "0"
        {
            displayNumber = "1"
        }
        else
        {
            displayNumber += "1"
        }
        
        if tempOperation.isEmpty {
            //아직 첫번째 숫자
            tempFirstNum = Int(displayNumber)!
        } else
        {//두번째 숫자
            tempSecondNum = Int(displayNumber)!
        }
        //디스플레이 변경

        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn2(_ sender: UIButton) {
        print("2")
        
        if displayNumber == "0"
        {
            displayNumber = "2"
        }
        else
        {
            displayNumber += "2"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn3(_ sender: UIButton) {
        print("3")
        if displayNumber == "0"
        {
            displayNumber = "3"
        }
        else
        {
            displayNumber += "3"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn4(_ sender: UIButton) {
        print("4")
        if displayNumber == "0"
        {
            displayNumber = "4"
        }
        else
        {
            displayNumber += "4"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn5(_ sender: UIButton) {
        print("5")
        if displayNumber == "0"
        {
            displayNumber = "5"
        }
        else
        {
            displayNumber += "5"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn6(_ sender: UIButton) {
        print("6")
        if displayNumber == "0"
        {
            displayNumber = "6"
        }
        else
        {
            displayNumber += "6"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn7(_ sender: UIButton) {
        print("7")
        if displayNumber == "0"
        {
            displayNumber = "7"
        }
        else
        {
            displayNumber += "7"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    @IBAction func ClickBtn8(_ sender: UIButton) {
        print("8")
        if displayNumber == "0"
        {
            displayNumber = "8"
        }
        else
        {
            displayNumber += "8"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }

    @IBAction func ClickBtn9(_ sender: UIButton) {
        print("9")
        if displayNumber == "0"
        {
            displayNumber = "9"
        }
        else
        {
            displayNumber += "9"
        }
        
        
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        } else
        {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }


}

