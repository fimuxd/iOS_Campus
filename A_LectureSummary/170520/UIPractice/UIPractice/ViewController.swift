//
//  ViewController.swift
//  UIPractice
//
//  Created by Bo-Young PARK on 22/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        /*********************************************************************************************************/
        //                                               viewByCode                                              //
        /*********************************************************************************************************/
        
//        let secondeView:UIView = UIView(frame: CGRect(x: 70, y: 70, width: 100, height: 120))
//        secondeView.backgroundColor = UIColor.blue
//        view.addSubview(secondeView)
//        
//        let titleLB:UILabel = UILabel(frame: CGRect(x: 70, y: 190, width: 100, height: 120))
//        titleLB.backgroundColor = UIColor.white
//        titleLB.text = "this is B"
//        self.view.addSubview(titleLB)
        
        /*********************************************************************************************************/
        //                                          viewAndLabelByCode                                           //
        /*********************************************************************************************************/

//                //iPhone 7 화면 위에 (15, 15, 345, 100) view 1개 + 같은 사이즈의 view를 화면 하단 15,15에 올릴 것
//        //iPhone 7 Point Resolution = 375 x 667 pts
//        
//        //1. 상단의 최초 View (검정색)
//        let viewOnSeven:UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
//        viewOnSeven.backgroundColor = UIColor.black
//        view.addSubview(viewOnSeven)
//        
//        //2. 하단의 최초 View (빨간색)
//        let viewOnSeven2:UIView = UIView(frame: CGRect(x: 15, y: 552, width: 345, height: 100))
//        viewOnSeven2.backgroundColor = UIColor.red
//        view.addSubview(viewOnSeven2)
//        
//        //3. 1번 View 속에 Label 만들기
//        let labelOnView:UILabel = UILabel(frame: CGRect(x: 15, y: 15, width: 300, height: 50))
//        labelOnView.backgroundColor = UIColor.white
//        labelOnView.text = "this is on Label"
//        labelOnView.textAlignment = NSTextAlignment.center
//        labelOnView.textColor = UIColor.blue
//        viewOnSeven.addSubview(labelOnView)
//        
//        //4. 2번 view 속에 Label 만들기
//        let labelOnView2:UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 50))
//        labelOnView2.backgroundColor = UIColor.cyan
//        labelOnView2.text = "this lable is on Red View"
//        labelOnView2.textColor = .yellow
//        viewOnSeven2.addSubview(labelOnView2)
//        
//        //5. 가운데 부분에 Label 만들기
//        let labelOnCenter:UILabel = UILabel(frame: CGRect(x: 87.5, y: 300, width: 200, height: 30))
//        labelOnCenter.backgroundColor = UIColor.darkGray
//        labelOnCenter.text = " Practice label by CODE #2"
//        labelOnView2.textAlignment = NSTextAlignment.right
//        labelOnCenter.font = UIFont(name: "Menlo", size: 12)
//        labelOnCenter.textColor = UIColor.white
//        self.view.addSubview(labelOnCenter)
        
        /*********************************************************************************************************/
        //                                          viewAndLabelByCode                                           //
        /*********************************************************************************************************/
        
//        let image1 = UIImageView(frame: CGRect(x: 30, y: 20, width: 315, height: 200))
//        image1.image = UIImage(named: "hardwell.jpg")
//        image1.contentMode = UIViewContentMode.scaleAspectFit
//        self.view.addSubview(image1)
//        
//        let image2 = UIImageView(frame: CGRect(x: 30, y: 220, width: 315, height: 200))
//        image2.image = UIImage(named: "hardwell.jpg")
//        image2.contentMode = UIViewContentMode.scaleToFill
//        self.view.addSubview(image2)
//        
//        let image3 = UIImageView(frame: CGRect(x: 30, y: 440, width: 315, height: 200))
//        image3.image = UIImage(named: "hardwell.jpg")
//        image3.contentMode = UIViewContentMode.scaleAspectFill
//        self.view.addSubview(image3)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

