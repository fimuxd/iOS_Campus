//
//  ViewController.swift
//  Enum
//
//  Created by Bo-Young PARK on 14/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    
//    // 바코드 관리에서
//    
//    //1. enum 설정
//    enum Barcode {
//        case upc(Int, Int, Int, Int)
//        case qrCode(String)
//    }
//

    enum Wearable {
        enum Weight: Int {
            case Light = 1
            case Mid = 4
            case Heavy = 10
        }
        enum Armor: Int {
            case Light = 2
            case Strong = 8
            case Heavy = 20
        }
        case Helmet(weight: Weight, armor: Armor)
        case Breastplate(weight: Weight, armor: Armor)
        case Shield(weight: Weight, armor: Armor)
    }
    
    
    /****************************************************************/
    //                          Life Cycle                          //
    /****************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
//        //2. Associated Values 값 설정
//        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
//        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
//        
//        //3. 값 불러오기
//        switch productBarcode {
//        case .upc(let numberSystem, let manufacturer, let product, let check):
//            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//        case .qrCode(let productCode):
//            print("QR code: \(productCode).")
//        }
//        
//        //4. 패턴 매칭
//        let productBarcode = Barcode.upc(8, 85909, 51226, 3)
//        
//        if case let Barcode.upc(8, companyCode, productCode, 3) = productBarcode
//        {
//            //정상 바코드
//            print(companyCode)
//            print(productCode)
//        }
        
        enum Wearable {
            enum Weight: Int {
                case Light = 1
            }
            enum Armor: Int {
                case Light = 2
            }
            case Helmet(weight: Weight, armor: Armor)
            func attributes() -> (weight: Int, armor: Int) {
                switch self {
                case .Helmet(let w, let a):
                    return (weight: w.rawValue * 2,
                            armor: a.rawValue * 4)
                }
            }
        }
        let woodenHelmetProps = Wearable.Helmet(weight: .Light,
                                                armor: .Light).attributes()
        print (woodenHelmetProps)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

