//
//  DiarySaveViewController.swift
//  HackerTonePractice
//
//  Created by 김태형 on 2017. 7. 6..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class DiarySaveViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var happyButtonOutlet: UIButton!
    @IBOutlet weak var joyButtonOutlet: UIButton!
    @IBOutlet weak var breathighButtonOutlet: UIButton!
    @IBOutlet weak var gladButtonOutlet: UIButton!
    @IBOutlet weak var displeasureButtonOutlet: UIButton!
    @IBOutlet weak var melancholyButtonOutlet: UIButton!
    @IBOutlet weak var sadButtonOutlet: UIButton!
    @IBOutlet weak var angerButtonOutlet: UIButton!
    
    
    var emotionCount:Int = 0
    var emotionTitle:String = ""
    var realUser:User?
    
    @IBAction func saveButtonTouched(_ sender: UIButton) {
        
        if emotionCount == 0 {
            saveFailAlert()
        }else
        {
            saveEmotion()
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    @IBAction func emotionButtonTouched(_ sender: UIButton) {

        if emotionCount == 0 {
            sender.isSelected = true
            emotionTitle = sender.currentTitle!
            emotionCount += 1
            
        }else if emotionCount == 1 && sender.isSelected
        {
            
            sender.isSelected = false
            emotionCount -= 1
            emotionTitle = sender.currentTitle!
            
        }else if emotionCount == 1 && !sender.isSelected
        {
            happyButtonOutlet.isSelected = false
            joyButtonOutlet.isSelected = false
            gladButtonOutlet.isSelected = false
            breathighButtonOutlet.isSelected = false
            displeasureButtonOutlet.isSelected = false
            melancholyButtonOutlet.isSelected = false
            sadButtonOutlet.isSelected = false
            angerButtonOutlet.isSelected = false
            sender.isSelected = true
            emotionTitle = sender.currentTitle!
            
        }
        print(emotionTitle)
    }
    @IBOutlet weak var diaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func saveEmotion() {
        
        let date = Date()
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyy MM dd"
        
        
        print(dateFormmater.string(from: date))
        
        let emoTemp: Emotion = Emotion(rawValue: emotionTitle)!
        
        let tempDic: [String: Any] = ["cellType": "0", "date": dateFormmater.string(from: date), "emotion": emoTemp.rawValue, "comment": diaryTextView.text!, "property1": ""]
        
        DataCenter.standard.addEmotionData(tempDic)
        
    }
    
    func saveFailAlert()
    {
        let alert = UIAlertController(title: "감정을 선택해주세요", message: "넹", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(self, animated: true, completion: nil)
    }
    
    func loadData() {
        realUser = DataCenter.standard.user
    }

}
