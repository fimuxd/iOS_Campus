//
//  ViewController.swift
//  VendingMachine
//
//  Created by Bo-Young PARK on 19/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // 외부 입력-잔돈 디스플레이에 보이는 변수 설정
    var displayInsertNumber:String = "0"
    var displayChangeNumber:String = "0"
    var currentInputValue:Int = 0
    let USD100:USDollar = USDollar(value: 100)
    let USD50:USDollar = USDollar(value: 50)
    let USD10:USDollar = USDollar(value: 10)
    
    // 각 제품의 이름과 가격 객체 설정
    let airPods:AppleAcc = AppleAcc(name: "AirPods", price: 159)
    let magicKeyboard:AppleAcc = AppleAcc(name: "Magic Keyboard", price: 99)
    let magicTrackpad:AppleAcc = AppleAcc(name: "Magic Trackpad 2", price: 129)
    let worldCharger:AppleAcc = AppleAcc(name: "World Charger", price: 45)
    
    // 각 제품의 트레이의 재고숫자 설정
    var aPTray:VMTray = VMTray(tray: [])
    var mKTray:VMTray = VMTray(tray: [])
    var mTTray:VMTray = VMTray(tray: [])
    var wCTray:VMTray = VMTray(tray: [])
    
    // 입력-잔돈 라벨
    
    @IBOutlet weak var insertLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var noticeLabel: UILabel!
    
    // 상품 갯수 라벨
    
    @IBOutlet weak var aPCountLabel: UILabel!
    @IBOutlet weak var mKCountLabel: UILabel!
    @IBOutlet weak var mTCountLabel: UILabel!
    @IBOutlet weak var wCCountLabel: UILabel!
    
    // 상품 나오는 곳 이미지
    @IBOutlet weak var ResultImageLabel: UIImageView!
    

    // 거스름돈 버튼 액션
    
    @IBAction func touchChangeBtn(_ sender: UIButton) {
        
        if self.currentInputValue >= 0 {
            self.changeLabel.text = "0"
            self.noticeLabel.text = "USD \(self.currentInputValue + Int(self.changeLabel.text!)!) for change"
            self.insertLabel.text = "0"
            self.currentInputValue = 0
        }
        else {
           self.noticeLabel.text = "INSERT BILL💵"
        }
        
    }
    
    // 상품 버튼 액션
    
    @IBAction func touchAPBtn(_ sender: UIButton) {
        
        if self.aPTray.tray.count > 0 {
            
            if currentInputValue >= self.airPods.price {
                self.currentInputValue -= self.airPods.price
                self.insertLabel.text = "0"
                self.changeLabel.text = String(currentInputValue)
                self.noticeLabel.text = "You Got an Airpods🎉"
                self.ResultImageLabel.image = #imageLiteral(resourceName: "AirPods 159.jpeg")
                
                if self.aPTray.tray.count > 0 {
                    self.aPTray.tray.remove(at: 0)
                    self.aPCountLabel.text = String(self.aPTray.tray.count)
                }
                    
            }
            else if currentInputValue < self.airPods.price {
                self.noticeLabel.text = "INSURFFICIENT CASH💸 :("
            }

        }
        else {
            self.aPCountLabel.text = String(self.aPTray.tray.count)
            self.noticeLabel.text = "SOLD OUT"
        }
    }
    
    @IBAction func touchMTBtn(_ sender: UIButton) {
       
        if self.mTTray.tray.count > 0 {
            
            if currentInputValue >= self.magicTrackpad.price {
                self.currentInputValue -= self.magicTrackpad.price
                self.insertLabel.text = "0"
                self.changeLabel.text = String(currentInputValue)
                self.noticeLabel.text = "You Got a Magic TrackPad🎉"
                self.ResultImageLabel.image = #imageLiteral(resourceName: "Magic Trackpad 2 129.jpeg")
                
                if self.mTTray.tray.count > 0 {
                    self.mTTray.tray.remove(at: 0)
                    self.mTCountLabel.text = String(self.mTTray.tray.count)
                }
                
            }
            else if currentInputValue < self.magicTrackpad.price {
                self.noticeLabel.text = "INSURFFICIENT CASH💸 :("
            }
            
        }
        else {
            self.mTCountLabel.text = String(self.mTTray.tray.count)
            self.noticeLabel.text = "SOLD OUT"
        }
    }
    
    @IBAction func touchMKBtn(_ sender: UIButton) {
        
        if self.mKTray.tray.count > 0 {
            
            if currentInputValue >= self.magicKeyboard.price {
                self.currentInputValue -= self.magicKeyboard.price
                self.insertLabel.text = "0"
                self.changeLabel.text = String(currentInputValue)
                self.noticeLabel.text = "You Got a Magic Keyboard🎉"
                self.ResultImageLabel.image = #imageLiteral(resourceName: "Magic Keyboard 99.jpeg")
                
                if self.mKTray.tray.count > 0 {
                    self.mKTray.tray.remove(at: 0)
                    self.mKCountLabel.text = String(self.mKTray.tray.count)
                }
                
            }
            else if currentInputValue < self.magicKeyboard.price {
                self.noticeLabel.text = "INSURFFICIENT CASH💸 :("
            }
            
        }
        else {
            self.mKCountLabel.text = String(self.mKTray.tray.count)
            self.noticeLabel.text = "SOLD OUT"
        }
    }
    
    @IBAction func touchWCBtn(_ sender: UIButton) {
        
        if self.wCTray.tray.count > 0 {
            
            if currentInputValue >= self.worldCharger.price {
                self.currentInputValue -= self.worldCharger.price
                self.insertLabel.text = "0"
                self.changeLabel.text = String(currentInputValue)
                self.noticeLabel.text = "You Got a World Charger🎉"
                self.ResultImageLabel.image = #imageLiteral(resourceName: "World Charger 45.jpeg")
                
                if self.wCTray.tray.count > 0 {
                    self.wCTray.tray.remove(at: 0)
                    self.wCCountLabel.text = String(self.wCTray.tray.count)
                }
                
            }
            else if currentInputValue < self.worldCharger.price {
                self.noticeLabel.text = "INSURFFICIENT CASH💸 :("
            }
            
        }
        else {
            self.wCCountLabel.text = String(self.wCTray.tray.count)
            self.noticeLabel.text = "SOLD OUT"
        }
    }
    
    // 지폐 버튼 액션
    
    @IBAction func touchUsd100Btn(_ sender: UIButton) {
        self.currentInputValue += self.USD100.value
        self.insertLabel.text = String(currentInputValue)
        self.changeLabel.text = "0"
    }
    
    @IBAction func touchUsd50Btn(_ sender: UIButton) {
        self.currentInputValue += self.USD50.value
        self.insertLabel.text = String(currentInputValue)
        self.changeLabel.text = "0"
    }
    
    @IBAction func touchUsd10Btn(_ sender: UIButton) {
        self.currentInputValue += self.USD10.value
        self.insertLabel.text = String(currentInputValue)
        self.changeLabel.text = "0"
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //에어팟 트레이
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        self.aPTray.tray.append(airPods)
        
        self.aPCountLabel.text = String(self.aPTray.tray.count)
        
        //매직키보드 트레이
        self.mKTray.tray.append(magicKeyboard)
        self.mKTray.tray.append(magicKeyboard)
        self.mKTray.tray.append(magicKeyboard)
        self.mKTray.tray.append(magicKeyboard)
        self.mKTray.tray.append(magicKeyboard)
        self.mKTray.tray.append(magicKeyboard)
        
        self.mKCountLabel.text = String(self.mKTray.tray.count)
        
        //매직트랙패드 트레이
        self.mTTray.tray.append(magicTrackpad)
        self.mTTray.tray.append(magicTrackpad)
        self.mTTray.tray.append(magicTrackpad)
        self.mTTray.tray.append(magicTrackpad)
        self.mTTray.tray.append(magicTrackpad)
        
        self.mTCountLabel.text = String(self.mTTray.tray.count)
        
        //월드차저 트레이
        self.wCTray.tray.append(worldCharger)
        self.wCTray.tray.append(worldCharger)
        self.wCTray.tray.append(worldCharger)
        
        self.wCCountLabel.text = String(self.wCTray.tray.count)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

