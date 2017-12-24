//
//  IntroViewController.swift
//  Geuneul
//
//  Created by Eunyeong Kim on 2017. 7. 6..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentOffset.x = 0
        updatePageNumb()
        scrollView.showsHorizontalScrollIndicator = false
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updatePageNumb()
    }
    
    func updatePageNumb() {
        let pageNumb: Int = Int(scrollView.contentOffset.x / self.view.bounds.width)
        self.pageControl.currentPage = pageNumb
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        
        self.scrollView.contentOffset.x = CGFloat(sender.currentPage) * self.view.bounds.width
        
    }


}
