//
//  ViewController.swift
//  UIScrollViewPractice
//
//  Created by Bo-Young PARK on 29/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIScrollView 
        
        //여기서 self. 는 생략할 수 있지만 있단 개념 이해를 위해 써두기로 한다.
        let scrollView:UIScrollView = UIScrollView(frame: self.view.bounds)
        
        //viewControl
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 3, height: self.view.bounds.height)
        self.view.addSubview(scrollView)
        
        //페이지 단위별로 끊어지게 하는 명령 (50% 이하로 넘어가면 원래 페이지, 50% 이상 넘어가면 다음 페이지로 보여주는 것)
        scrollView.isPagingEnabled = true
        
        //시작하는 포인트
        scrollView.contentOffset = .init(x: 0, y: 0)
        
        //위,아래,좌,우에 여백을 두는 것
        scrollView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        //스크롤뷰 외 여백을 아예 차단하는 명령
        //scrollView.bounces = false
        
        //가로로 움직일 때마다 스크롤뷰 인디케이터를 표시해주는 명령
        scrollView.showsHorizontalScrollIndicator = true
        
        //인디케이터의 색상을 변경하는 것
        scrollView.indicatorStyle = .black
        
        
        
        
        //상기에 만든 ScrollView를 확인하기 위한 View를 만들어보자. 하단의 UIColor도 타입 추론을 통해 생략할 수 있다.
        let view1:UIView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
        view1.backgroundColor = UIColor.yellow
        //contentsView에 추가해야 하는데, contentsView는 선택할 수 없다. 따라서 상위에 있는 scrollview에 바로 addSubview를 한다.
        scrollView.addSubview(view1)
        
        
        let view2:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
        view2.backgroundColor = UIColor.red
        scrollView.addSubview(view2)
        
        let view3:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width * 2, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
        view3.backgroundColor = UIColor.blue
        scrollView.addSubview(view3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

