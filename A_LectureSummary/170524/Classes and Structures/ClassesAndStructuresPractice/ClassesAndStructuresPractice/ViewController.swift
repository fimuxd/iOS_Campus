//
//  ViewController.swift
//  ClassesAndStructuresPractice
//
//  Created by Bo-Young PARK on 24/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class FirstVCViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var b1:Book = Book(name: "클래스", cost: 50000, isbn: 1)
        var b2 = b1
        b2.name = "Class"
        
        print(b1.name)
        print(b2.name) //ㅇ
        
        let bas1:BookStore = BookStore(computerBooks: [], name: "신사점", address: "신사동")
        let bas2 = bas1
        bas2.name = "강남점"

        print(bas1.name)
        print(bas2.name)
    }
}







class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

