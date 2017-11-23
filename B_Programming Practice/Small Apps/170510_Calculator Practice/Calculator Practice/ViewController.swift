//
//  ViewController.swift
//  Calculator Practice
//
//  Created by Bo-Young PARK on 10/5/2017.
//  Copyright © 2017 Bo-Young Park, Byron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /***********************************************/
    //MARK:-          PROPERTIES                   //
    /***********************************************/
    
    @IBOutlet var displayLabel: UILabel!
    
    // 내부적으로 돌아가는 변수들 설정
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    
    // 외부 디스플레이에 보이는 변수 설정 (실제 계산과 디스플레이를 분리)
    var displayNumber:String = "0"
    
    
    /***********************************************/
    //MARK:-           FUNCTIONS                   //
    /***********************************************/
    
    // 170516_func + switch 함수이용해서 display에 0이 있을 때는 입력한 숫자만 표시, 그렇지 않을 땐 입력한 숫자를 앞 숫자에 붙이는 함수 만들기
    //git Test
    func addDisplayNumber(numberString:String) {
        switch displayNumber {
        case "0":
            displayNumber = numberString
        default:
            displayNumber += numberString
        }
    }
    
    //170516_func + if 함수 이용해서 입력한 숫자가 첫번째 숫자인지, 두번째 숫자인지 판단해 각각에 저장하는 함수 operation(기호)이 empty 상태면 첫번째 숫자에, 있으면 두번째 숫자에 넣기
    func addFirstSecondNumber() {
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNumber)!
        }
        else {
            tempSecondNum = Int(displayNumber)!
        }
        displayLabel.text = displayNumber
    }
    
    ///기호를 넣어주고 기호 라벨을 업데이트 합니다.
    func updateTempOperation(_ operation:String) {
        tempOperation = operation
        displayNumber = "0"
    }
    
    
    /***********************************************/
    //MARK:-          LIFECYCLES                   //
    /***********************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
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
    
    
    // 사칙연산 버튼 액션
    @IBAction func touchedOperationButton(_ sender: UIButton) {
        print("사착연산 기호를 클릭하였습니다.")
        updateTempOperation(sender.currentTitle!)
        displayNumber = "0"
    }
    
    
    //사칙연산 함수
    //나누기 함수
    func devide(firstNum:Int, secondNum:Int) -> Int
    {
        return firstNum / secondNum
    }
    
    //곱하기 함수
    func by(firstNum:Int, secondNum:Int) -> Int
    {
        return firstNum * secondNum
    }

    //빼기 함수
    func minus(firstNum:Int, secondNum:Int) -> Int
    {
        return firstNum - secondNum
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
    
    @IBAction func touchedNumberButton(_ sender: UIButton) {
        print("0...9 숫자버튼이 클릭되었습니다")
        
        addDisplayNumber(numberString:sender.currentTitle!)
        
        // 또는 옵셔널을 이용해서 addDisplayNumber(sender.titleLabe?.text!)!)
        // 의미: 숫자버튼에 입력되어 있는 숫자자체도 String이다. 이걸 그대로 표시하라는 뜻
       
        addFirstSecondNumber()
        
        self.displayLabel.text = displayNumber
        
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
    
    
}

