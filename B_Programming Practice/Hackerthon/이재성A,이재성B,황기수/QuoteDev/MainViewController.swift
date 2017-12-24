//
//  ViewController.swift
//  QuoteDev
//
//  Created by leejaesung on 2017. 7. 6..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var imageQuoteImg:UIImageView?
    @IBOutlet var labelQuoteContent:UILabel?
    @IBOutlet var labelQuoteSpeaker:UILabel?
    
    @IBOutlet var buttonLikeNum:UIButton?
    @IBOutlet var buttonCommentNum:UIButton?
    
    @IBOutlet var labelCommentName1:UILabel?
    @IBOutlet var labelCommentContent1:UILabel?
    @IBOutlet var labelCommentName2:UILabel?
    @IBOutlet var labelCommentContent2:UILabel?
    
    var mainRootData = DataCenter.sharedInstance.rootData
    
    var randomNum = Int(arc4random_uniform(4))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataCenter.sharedInstance.loadData()
        DataCenter.sharedInstance.loadCommentData()
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let tempCommentData = DataCenter.sharedInstance.getCommentDataOf(index: secondRandomNumber)
        labelCommentName1?.text = tempCommentData.getDicOf(index: 0).nickName
        labelCommentContent1?.text = tempCommentData.getDicOf(index: 0).comment
        labelCommentName2?.text = tempCommentData.getDicOf(index: 1).nickName
        labelCommentContent2?.text = tempCommentData.getDicOf(index: 1).comment
        buttonCommentNum?.setTitle(String(tempCommentData._arrComment.count), for: .normal)
    }
    
    @IBAction func buttonReloadAction(_ sender:UIButton) {
        print("buttonReload")
        
        loadData()
    }
    
    @IBAction func buttonSettingAction(_ sender:UIButton) {
        print("buttonSettingAction")
        // Segue로 SettingViewController로 연결.
    }
    
    @IBAction func buttonLikeAction(_ sender:UIButton) {
        print("buttonLikeAction")
        
    }
    
    @IBAction func buttonCommentAction(_ sender:UIButton) {
        print("buttonCommentAction")
        
        UserDefaults.standard.set(randomNum, forKey: "currentIndex")
        
    }
    
    @IBAction func buttonCommentNumAction(_ sender:UIButton) {
        UserDefaults.standard.set(randomNum, forKey: "currentIndex")
    }
    
    @IBAction func buttonSavePhotoAction(_ sender:UIButton) {
        print("buttonSavePhotoAction")
        
    }

}

