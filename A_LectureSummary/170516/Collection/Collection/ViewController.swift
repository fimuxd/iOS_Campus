//
//  ViewController.swift
//  Collection
//
//  Created by Bo-Young PARK on 16/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // array 생성
        var list:[Int] = [1,2,3,4,5,6,7,8]
        
        // 배열 추가
        list.append(10)
        
        // 어디에 넣어라
        list.insert(11, at:3)
        
        // index 0을 지워라
        list.remove(at:0)
        
        // list.index(of: Int) 를 이용해서, 배열에 숫자'4'를 지우라는 명령. 여기서 !를 붙이는 이유는, 리스트에 숫자'4'가 없을 수도 있기 때문
        list.remove(at: list.index(of: 4)!)
        
        //빈 배열 확인
        if !list.isEmpty {
            print(list)
            print(list.count)
        }
        
        // 배열 붙이기
        let list2:[Int] = [12,13]
        let list3 = list + list + list2
        print(list3)
            
            
    }
    

        
        // Do any additional setup after loading the view, typically from a nib.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

