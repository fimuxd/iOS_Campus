//
//  ViewController.swift
//  BaseBall
//
//  Created by Bo-Young PARK on 23/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //입력 라벨
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    //상황 알려주는 라벨
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    //정답 숫자 Array
    var answerNumbers:[Int] = []
    
    func makeAnswerArray() {
        
        while self.answerNumbers.count < 3 {
            var randomNumber:UInt32 = arc4random_uniform(9) + 1
            if !(self.answerNumbers.contains(Int(randomNumber))) {
                self.answerNumbers.append(Int(randomNumber))
            }
        }
    }
    
    //입력 숫자 Array
    var inputNumbers:[Int] = []
    
    //실행횟수 
    var tryCount:Int = 0
    
    //게임 시작
    @IBAction func startBtn(_ sender: UIButton) {
        var strikeCount:Int = 0
        var ballCount:Int = 0
        var outCount:Int = 0
        
        
        if self.thirdLabel.text != "" {
            for index in 0...2 {
                if answerNumbers[index] == inputNumbers[index] {
                    strikeCount += 1
                }
                else if answerNumbers.contains(inputNumbers[index]) {
                    ballCount += 1
                }
                else {
                    outCount += 1
                }
            }
            self.tryCount += 1
            self.tryLabel.text = "TRY \(self.tryCount)"
            self.statusLabel.text = "Strike: \(strikeCount) | Ball: \(ballCount) | Out: \(outCount)"
            self.inputNumbers = []
            self.firstLabel.text = ""
            self.secondLabel.text = ""
            self.thirdLabel.text = ""
        }
        else if self.thirdLabel.text == "" || self.secondLabel.text == "" {
            inputNumbers = []
            firstLabel.text = ""
            secondLabel.text = ""
            self.statusLabel.text = "ENTER 3 NUMBERS"
        }
        
    }
    
    //게임 리셋
    @IBAction func resetBtn(_ sender: Any) {
        answerNumbers = []
        makeAnswerArray()
        print(answerNumbers)
        inputNumbers = []
        tryCount = 0
        self.firstLabel.text = ""
        self.secondLabel.text = ""
        self.thirdLabel.text = ""
        self.statusLabel.text = "ENTER 3 NUMBERS"
        self.tryLabel.text = ""
    }

    //숫자버튼
    @IBAction func numberBtn(_ sender: UIButton) {
        if self.firstLabel.text == "" {
            self.firstLabel.text = String(sender.tag)
            inputNumbers.insert(Int(firstLabel.text!)!, at: 0)
        }
        else if self.secondLabel.text == "" {
            if inputNumbers.contains(sender.tag) {
                self.statusLabel.text = "DUPLICATED NUMBER"
            }
            else {
            self.secondLabel.text = String(sender.tag)
            inputNumbers.insert(Int(secondLabel.text!)!, at: 1)
            }
        }
        else if self.thirdLabel.text == "" {
            if inputNumbers.contains(sender.tag) {
                self.statusLabel.text = "DUPLICATED NUMBER"
            }
            else {
            self.thirdLabel.text = String(sender.tag)
            inputNumbers.insert(Int(thirdLabel.text!)!, at: 2)
            print(inputNumbers)
            }
        }
        else {
            self.statusLabel.text = "PLEASE PUSH GAME START"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //정답 생성
        makeAnswerArray()
        print(answerNumbers)
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

