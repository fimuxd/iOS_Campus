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
        
        // 1. array 생성
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
        
        // 혼자 해보는 복습
        var mammals:[String] = ["🐶", "🐯", "🐷", "🐰", "🐵"]
        print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵"]
        
        print(mammals.contains("🐶")) //print값: true
    
        mammals.append("🐸")
        print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵", "🐸"]
        
        mammals.remove(at: 2)
        print(mammals) // print ["🐶", "🐯", "🐰", "🐵", "🐸"]
        
        print(mammals.count) // print 5
        
        if !mammals.isEmpty {
            print("이 Array의 Element 수는 \(mammals.count)개 입니다.")
        }
        else{
            print("이 Array는 비어있습니다")
        }
        
        
        // 2. set 생성
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items")
        // Prints "letters is of type Set<Character> with 0 items."
        
        letters.insert("a")
        // letters now contains 1  value of type Character
        
        letters = []
        
        // 2-1. Set 집합 연산
        // 홀수의 모임
        var oddDigits:Set = [1,3,5,7,9]
        
        // 짝수의 모임
        let evenDigits:Set = [2,4,6,8]
        
        // 소수의 모임
        let primeDigits:Set = [2,3,5,7]
        
        //홀수와 짝수의 교집합(Intersection) 만들기
        print(oddDigits.intersection(evenDigits))
        
        //홀수와 소수의 교집합을 제외한 수(symmetricDifference)
        print(oddDigits.symmetricDifference(primeDigits))
        
        //홀수와 짝수의 합집합(union)
        print(oddDigits.union(evenDigits).sorted())
        
        //홀수이면서 소수가 아닌 집합(subtracting) > 단 리턴값이 없어서 아무것도 출력되지 않음
        oddDigits.subtract(primeDigits)
        
        //여기까지 적용하고 oddDigits를 확인하면 [9,1] set가 나온다
        print(oddDigits)
        
        //이것을 sorted() 하면, Array의 형태로 정렬해서 출력된다
        print(oddDigits.sorted())
        
        
        // 혼자 해보는 복습
        var haveWings:Set = ["bird", "butterfly", "bet"]
        var mammal:Set = ["bet", "tiger", "pig"]
        var bugs:Set = ["butterfly", "ant", "spider"]
        
        print(haveWings.intersection(mammal))
        
        print(mammal.union(bugs)) // 순서 없이 나열
        
        print(mammal.union(bugs).sorted()) // sorted()를 이용해서 abc순으로 정렬
        
        print(bugs.symmetricDifference(haveWings)) // 순서 없이 나열
        
        print(bugs.symmetricDifference(haveWings).sorted()) // sorted()를 이용해서 abc순으로 정렬
        
        print(bugs.subtract(mammal)) // subtract는 리턴 값이 없음
        
        
        
        
        // 3. Dictionary
        // Dictionary 만들기
        var iOSStudent:Dictionary<String,String> = ["박보영":"남성", "박종훈":"남성"]
        
        // 불러오기
        print("\(iOSStudent["박보영"])")
        
        // 몇 개의 elements를 가지고 있는지
        print(iOSStudent.count)
        
        // 새로운 elements 추가
        iOSStudent["조선미"] = "여성"
        
        // 기존 elements의 값 변경
        iOSStudent["박보영"] = "여성"
        print(iOSStudent)
        
        // 기존의 key:value 쌍을 dictionary에서 삭제
        iOSStudent.removeValue(forKey: "박종훈")
        print(iOSStudent)
        
        
        
        // 혼자 해보는 복습
        var worldMap:Dictionary<String,String> = ["Korea":"Asia", "USA":"America", "Spain":"Europe"]
            // 같은 의미, var worldmap:[String:String] = ["Korea":"Asia", "USA":"America", "Spain":"Europe"]
        
        print(worldMap.count) // print값: 3
        
        worldMap["Korea"] = "EastAsia"
        print(worldMap) // print값: ["Korea":"EastAsia", "USA":"America", "Spain":"Europe"]
        
        print(worldMap["USA"]) // print값: "America"
        
        worldMap["Egypt"] = "Africa"
        print(worldMap) // print값: ["Korea":"Asia", "Egypt":"Africa", "Spain":"Europe", "USA":"America"]
        
        // 4. 반복문 - while 문
        //구구단 만들기
        // 1. 구구단(multipicationTable) 함수 생성
        func multipicationTable(level:Int) {
        
            // 2. 곱(step)을 의미하는 변수 설정
            var step:Int = 1
            
            // 3. 곱이 1...9 반복할 while문 설정
            while step <= 9 {
                print("\(level) * \(step) = \(level*step)")
            
                // 4. 무한 loop 되지 않도록 반복할 때마다 곱이 증가하도록 설정
                step += 1
            }
        }
        
        multipicationTable(level: 26)
        /* print값:
             26 * 1 = 26
             26 * 2 = 52
             26 * 3 = 78
             26 * 4 = 104
             26 * 5 = 130
             26 * 6 = 156
             26 * 7 = 182
             26 * 8 = 208
             26 * 9 = 234
        */
 
 
        // 5. 반복문 - for-in 문
        //구구단 만들기 > 나중에 해볼 것
        
        // 1. for-in문을 이용한 구구단 함수 생성
        func forInMultipicationTable(level:Int) {
            
            // 2. for-in의 경우, 별도의 변수타입 설정을 해주지 않아도 되므로 step을 그대로 사용함
            for step in 1...9 {
                print("\(level) * \(step) = \(level*step)")
            }
        }
        
        forInMultipicationTable(level: 19)
        /* print값:
             19 * 1 = 19
             19 * 2 = 38
             19 * 3 = 57
             19 * 4 = 76
             19 * 5 = 95
             19 * 6 = 114
             19 * 7 = 133
             19 * 8 = 152
             19 * 9 = 171
         */
        
        //lotto 숫자 출력하기
        //1...45, 숫자 6개 뽑기 (중복을 허용하는 함수)
        
        // 1. 로또번호 6개의 Array 값을 출력해주는 함수를 생성
        func tellMeLotto() -> [Int] {
            
            // 2. 로또번호 6개의 Array 값 명명
            var lottoNumber:[Int] = [] // or = [Int]()
        
            
            // 3. 6번 반복하는 for-in 문 생성
            for _ in 1...6 {
                
                // 4. arc4random을 이용. unifrom(n) = 0 ~ n-1 사이의 값 랜덤으로 출력
                let randomNumber:UInt32 = arc4random_uniform(46)
                // 5. arc4random이 0을 포함하는데 로또번호에는 0이 없으므로, 0을 제외하고 array에 넣어주는 if 문 생성
                if randomNumber != 0 {
                    lottoNumber.append(Int(randomNumber))
                }
            }
            return lottoNumber
        }
        
        print(tellMeLotto())
        
        //중복허용하지 않는 로또
        
        func tellMeLotto1() -> [Int] {
            var lottoNumber:[Int] = []
            
            while lottoNumber.count < 6 {
                let randomNumber:UInt32 = arc4random_uniform(46)

                if randomNumber != 0 && !lottoNumber.contains(Int(randomNumber)) {
                    lottoNumber.append(Int(randomNumber))
                }
            }
            return lottoNumber
        }
        
        // 로또 넘버가 123 순서로 출력된다.
        print(tellMeLotto1().sorted)
        
        // 약수 구하기
        func findDivisor(inputNumber:Int) -> [Int]{
            var divisor:[Int] = []
            
            for number in 1...inputNumber {
                if inputNumber%number == 0 {
                    divisor.append(number)
                }
            }
            return divisor
        }
        
        print(findDivisor(inputNumber: 20))
        
        
        
        // 소수 판별기
        func isDecimal(inputNumber:Int) -> Bool {
            var divisor:[Int] = []
            
            for number in 1...inputNumber {
                if inputNumber%number == 0 {
                    divisor.append(number)
                }
            }
            
            if divisor.count <= 2 {
                print("\(inputNumber)은(는) 소수입니다.")
                return true
            }
            print("\(inputNumber)은(는) 소수가 아니며, \(divisor)와 같은 약수를 가집니다.")
            return false
        }
        
        isDecimal(inputNumber: 13)
        //print값: 13은(는) 소수입니다.
        
        isDecimal(inputNumber: 20)
        //print값: 20d은(는) 소수가 아니며, [1, 2, 4, 5, 10, 20]와 같은 약수를 가집니다.
    
        
        
        }
    


        // Do any additional setup after loading the view, typically from a nib.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
