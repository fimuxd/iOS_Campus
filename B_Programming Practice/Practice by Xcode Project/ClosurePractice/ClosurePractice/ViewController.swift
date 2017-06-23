//
//  ViewController.swift
//  ClosurePractice
//
//  Created by Bo-Young PARK on 23/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /********************************************************/
    //                  IBAction | Function                 //
    /********************************************************/
    //MARK: 함수 영역
    
    //-----로또 번호 랜덤으로 뽑아서 어레이로 출력해주는 함수
    func pickRandomLottoNumber() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            numberSet.insert(Int(arc4random_uniform(UInt32(45))+1))
        }
        
        let resultArray = numberSet.sorted(by: {(num1:Int, num2:Int) -> Bool in
            return num1 < num2}) //(Int, Int) -> Bool: Closure 문법이다. Int 두개를 받아서 Bool값을 리턴하라는 것
        
        return resultArray
    }
    
    
    /********************************************************/
    //                      Life Cycle                      //
    /********************************************************/
    //MARK: View Life Cycle 영역
    
    override func viewWillAppear(_ animated: Bool) {
        let alert:UIAlertController = UIAlertController.init(title: "Clearing Histories...", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        let okAction:UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: {(sender: UIAlertAction) in print("OK가 눌렸습니다.")})
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: {print("Alert is presented")}) //completion: 버튼을 눌렀을 때 어떤 액션을 할지 구현할 내용을 적는 부분
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pickRandomLottoNumber())

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

