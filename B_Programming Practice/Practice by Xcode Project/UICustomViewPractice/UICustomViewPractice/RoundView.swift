//
//  RoundView.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 12/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class RoundView: UIView {

    @IBOutlet var title:UILabel?
    @IBOutlet var btn:UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width/2 // Corner의 Radius는 Width 또는 Height의 절반 값이다.
        self.layer.borderColor = UIColor.black.cgColor //버튼 프레임의 테두리 색을 검정색이라고 한다
        self.layer.borderWidth = 1
        self.backgroundColor = .lightGray //storyboard에서 어떠한 색으로 설정하든, view의 바탕은 밝은회색이다. 코드가 나중에 실행되기 때문이다.
    }
    
    //외부에서 텍스트를 받아오면 title Label에 표시되도록 하는 것
    func setTitleText(_ text:String) {
        if let titleLB = title {
            titleLB.text = text
        }
    }
}
