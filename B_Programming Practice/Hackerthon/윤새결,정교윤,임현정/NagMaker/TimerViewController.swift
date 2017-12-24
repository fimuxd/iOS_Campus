//
//  TimerViewController.swift
//  NagMaker
//
//  Created by 윤새결 on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import UIView_Shake

class TimerViewController: UIViewController {
    
    
    private var timer: Timer?
    private var isPlay: Bool = true
    //var nagData: [String:Any] = [:]
    var nagData: Nag?
    var duration: Int?
    private let synthesizer = AVSpeechSynthesizer()
    var tempIndex: Int = 0
    
    //MARK:- outlet
    
    @IBOutlet weak var nagTitleLable: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //MARK:- IBACtion
    
    @IBAction func touchedTimerButton(_ sender: UIButton) {

        if isPlay == true {
            sender.setImage(UIImage.init(named: "play.png"), for: .normal)
            self.isPlay = false
            self.timer?.invalidate()
            self.synthesizer.pauseSpeaking(at: .immediate)
        } else {
            sender.setImage(UIImage.init(named: "pause.png"), for: .normal)
//            isPlay = true
            self.timer?.fire(startTimer(index: tempIndex))
            let utterance = AVSpeechUtterance(string: (nagData?.nagTitle)!)
            self.synthesizer.speak(utterance)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startTimer(index: duration!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nag = self.nagData?.nagTitle
        self.duration = nagData?.duration
        self.nagTitleLable.text = nag
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.synthesizer.stopSpeaking(at: .immediate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer(index: Int) {
        var realIndex = index
        let nag = self.nagData?.nagTitle
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) -> Void in

            let formatter = DateFormatter()
            formatter.dateFormat = "mm:ss"
            self.timerLabel.text = formatter.string(for: index)
            
            self.timerLabel.text = String(realIndex)
            
            let utterance = AVSpeechUtterance(string: nag!)
            utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
            utterance.rate = 0.48
            self.synthesizer.speak(utterance)
            
            
            realIndex -= 1
            
            self.tempIndex = realIndex
            
            if realIndex == 5 {
                self.view.shake(400, withDelta: 5.0, speed: 0.03, shakeDirection: ShakeDirection.vertical)
            }
            if realIndex == 0 {
                
                self.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                self.timer?.invalidate()
                
                let afterNagY = self.nagData?.nagAnswerY
                let afterNagN = self.nagData?.nagAnswerN
                
                let alert: UIAlertController = UIAlertController(title: "다했니?", message: "검사한다?", preferredStyle: .alert)
                let alertActionYes: UIAlertAction = UIAlertAction(title: "다했어요", style: .default, handler: { (action: UIAlertAction) -> Void in
                    let utteranceYes = AVSpeechUtterance(string: afterNagY!)
                    utteranceYes.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    utteranceYes.rate = 0.4
                    self.synthesizer.speak(utteranceYes)
                })
                
                let alertActionNo: UIAlertAction = UIAlertAction(title: "아니요", style: .default, handler: { (action: UIAlertAction) -> Void in
                    let utteranceNo = AVSpeechUtterance(string: afterNagN!)
                    utteranceNo.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    utteranceNo.rate = 0.4
                    self.synthesizer.speak(utteranceNo)
                })
                
                alert.addAction(alertActionYes)
                alert.addAction(alertActionNo)
                
                self.present(alert, animated: true, completion: nil)
                self.timerLabel.text = String(0)
            }   
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addVC: AddAndEditViewController = segue.destination as! AddAndEditViewController
        
        print(self.nagData!)
        
        addVC.editedItem = self.nagData
        addVC.isEditMode = true
        
       // self.present(addVC, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
