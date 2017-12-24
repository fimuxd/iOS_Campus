//
//  TodayViewController.swift
//  QuoteDevWidget
//
//  Created by HwangGisu on 2017. 7. 7..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var imageQuoteImg:UIImageView?
    @IBOutlet var labelQuoteContent:UILabel?
    @IBOutlet var labelQuoteSpeaker:UILabel?
    
    var randomNum = Int(arc4random_uniform(4))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        loadData()
        
    }
    
    override func viewWillAppear (_ animated : Bool)
    {
        var currentSize : CGSize = self.preferredContentSize
        currentSize.height = 200.0
        self.preferredContentSize = currentSize
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func loadData() {
        var secondRandomNumber = Int(arc4random_uniform(9))
        
        // 같은 이미지가 반복되지 않도록 예외처리
        while randomNum == secondRandomNumber {
            secondRandomNumber = Int(arc4random_uniform(9))
        }
        randomNum = secondRandomNumber
        print(secondRandomNumber)
        
        print(DataCenter.sharedInstance.getQuoteImageFileNameOf(index: secondRandomNumber))
        imageQuoteImg?.image = UIImage(named: DataCenter.sharedInstance.getQuoteImageFileNameOf(index: secondRandomNumber))
        labelQuoteContent?.text = DataCenter.sharedInstance.getQuoteContentOf(index: secondRandomNumber)
        labelQuoteSpeaker?.text = "- \(DataCenter.sharedInstance.getQuoteSpeakerOf(index: secondRandomNumber)) -"
        
        //        let testData = DataCenter.sharedInstance.getCommentDataOf(index: randomNumber)
        //        labelCommentName1?.text = testData.getDicOf(index: 0).nickName
        //        labelCommentContent1?.text = testData.getDicOf(index: 0).comment
        //        labelCommentName2?.text = testData.getDicOf(index: 1).nickName
        //        labelCommentContent2?.text = testData.getDicOf(index: 1).comment
    }
}
