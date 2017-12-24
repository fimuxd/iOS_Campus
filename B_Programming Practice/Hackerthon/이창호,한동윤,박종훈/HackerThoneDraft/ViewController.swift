//
//  ViewController.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/6/17.
//  Copyright © 2017 DY. All rights reserved.
//

import UIKit
import AVFoundation

extension UIView:Explodable {}

class ViewController: UIViewController, GameViewDelegate{
    
    
    var timerForImage = Timer()
    var colors:[UIColor]?
    
    var randomContainer:[Int] = []
    var colorsUserPicked:[Int] = []
    
    var userButtons:[UserAnswerButton] = []
    
    var answerView:[UIImageView] = []
    var answerViewLocationFlag:Int = 0

    var squareCell:UIView?
    
    @IBOutlet weak var gameView: GameView!

    @IBOutlet weak var gameViewWillBack: GameView!

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var lightOn:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colors = Colors.level3
        randomContainer = self.createRand(container: (colors?.count)!)
        self.gameView.delegate = self
        self.firstImageView.isHidden = true
        
        lightOn.layer.borderWidth = 1
        lightOn.layer.borderColor = UIColor.clear.cgColor
        lightOn.layer.cornerRadius = lightOn.frame.width / 2

    }

    @IBAction func buttonTouched(_ sender: UIButton) {
        let imageCounter = 0
//        let imagesStr:[String] = ["three1","two1","one1"]
        let imagesStr:[String] = ["start"]
        self.firstImageView.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        self.firstImageView.alpha = 0
        self.firstImageView.isHidden = false
        self.changeImages(imgString: imagesStr, imgCounter: imageCounter)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.firstImageView.alpha = 1
        }) { [unowned self] (_) in
            self.firstImageView.isHidden = true
            self.gameView.startChange()
            sender.isEnabled = false

        }
        
//        self.timerForImage = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (_) in
//            if imageCounter == 3
//            {
//                self.firstImageView.isHidden = true
//                self.gameView.startChange()
//                self.timerForImage.invalidate()
////                imageCounter = 0
//            }else
//            {
//                self.changeImages(imgString: imagesStr, imgCounter: imageCounter)
//                imageCounter += 1
//            }
//        })

//        self.firstImageView.isHidden = true
//        self.gameView.startChange()
//        sender.isEnabled = false
//        sender.isHidden = true
        
    }
  
    func createRand(container max:Int) -> [Int]
    {
        var randNumContainer:[Int] = []
        var randNum = Int(arc4random_uniform(UInt32(max)))
        randNumContainer.append(randNum)
        
        while randNumContainer.count < max
        {
            randNum = Int(arc4random_uniform(UInt32(max)))
            if !randNumContainer.contains(randNum)
            {
                randNumContainer.append(randNum)
            }
        }
        print("randNumContainer.count: \(randNumContainer.count)")
        return randNumContainer
    }
    
    //gameViewDelegate
    func makeButtonsForAnswer(colors: [UIColor])
    {
        let spaceBtwButtons:CGFloat = 10
        
        let buttonSide = (self.view.frame.width - spaceBtwButtons) / CGFloat(colors.count) - spaceBtwButtons
        
        for i in 0..<colors.count
        {
            let userButton = UserAnswerButton(frame: CGRect(x:  spaceBtwButtons + (CGFloat(i) * (buttonSide + spaceBtwButtons)), y: self.view.frame.height * 7/10 + (buttonSide / 2), width: buttonSide, height: buttonSide))
            userButton.backgroundColor = colors[randomContainer[i]]
            userButton.tag = i
            userButton.addTarget(self, action: #selector(ViewController.colorButtonTouched(sender:)), for: .touchUpInside)
            self.userButtons.append(userButton)
            self.view.addSubview(userButton)
        }
    }
    
    func makeAnswerView()
    {
        
        let spaceBtwButtons:CGFloat = 10
        
        let buttonSide = (self.view.frame.width - spaceBtwButtons) / CGFloat((colors?.count)!) - spaceBtwButtons
        
        for i in 0..<Colors.level3.count
        {
            let answerImage = UIImageView(frame: CGRect(x:  spaceBtwButtons + (CGFloat(i) * (buttonSide + spaceBtwButtons)), y: self.view.frame.height * 3 / 4 + (buttonSide), width: buttonSide, height: buttonSide))
            answerImage.image = UIImage(named: "empty")
//            answerImage.layer.borderColor = UIColor.black.cgColor
//            answerImage.layer.borderWidth = 1
//            answerImage.layer.cornerRadius = 1
            self.answerView.append(answerImage)
            self.view.addSubview(answerImage)
        }
    }

    func touchFirstButton()
    {
        let firstAnserIndex = randomContainer.index(of: 0)
        self.colorButtonTouched(sender: userButtons[firstAnserIndex!])
    }

    
    func changeImages(imgString:[String], imgCounter:Int)
    {
        self.firstImageView.isHidden = false
        self.firstImageView.image = UIImage(named: imgString[imgCounter])
    }
    
    func colorButtonTouched(sender: UserAnswerButton)
    {
        let tag = sender.tag
        let originalFrameOrigin = sender.frame.origin
        let originalFrameSize = sender.frame.size
        let newFrameOrigin = answerView[answerViewLocationFlag].frame.origin
        
        print("randContainer : \(randomContainer)")
        if colors?[randomContainer[tag]] == colors?[answerViewLocationFlag]
        {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations:{
            
                sender.frame.origin = newFrameOrigin
            }) { [unowned self] (_) in
                sender.explode(.chaos, duration: 3)
                
                self.answerView[self.answerViewLocationFlag].backgroundColor = sender.backgroundColor
                self.answerView[self.answerViewLocationFlag].image = nil
                self.answerView[self.answerViewLocationFlag].layer.borderColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).cgColor
                self.answerView[self.answerViewLocationFlag].layer.borderWidth = 2
                
                if self.answerViewLocationFlag == (self.colors?.count)! - 1
                {

//                    for userAnswer in self.answerView.reversed()
//                    {
//                        userAnswer.image = UIImage(named: "like")
//                        userAnswer.layer.borderWidth = 0.5
//                        userAnswer.layer.borderColor = UIColor.black.cgColor
//                    }
//                    let gameViewCenterOrigin = CGPoint(x: 10,  y: self.view.frame.height - self.gameView.frame.height - (self.gameView.frame.height / 2))
//                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//                        for userAnswer in self.answerView.reversed()
//                        {
//
//                            userAnswer.backgroundColor = .clear
//                            userAnswer.frame.origin = gameViewCenterOrigin
//                            userAnswer.frame.size = self.firstImageView.frame.size
//                            userAnswer.alpha = 0
//                            
//                        }
//
//                    }, completion: { (_) in
                        self.answerView[0].frame.size = originalFrameSize
                        self.gameView.timer.invalidate()
                        self.gameView.explode(.chaos, duration: 3)
                        self.firstImageView.isHidden = false
                        self.firstImageView.backgroundColor = .clear
                        self.firstImageView.alpha = 0
                    self.firstImageView.image = UIImage(named: "dots")
                    self.firstImageView.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
                        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: { [unowned self] in
                            self.firstImageView.alpha = 1
                            for userAnswer in self.answerView.reversed()
                            {
                                userAnswer.alpha = 0
                            }

                        }, completion: nil)
//                    })
                }else
                {
                    self.answerViewLocationFlag += 1
                }
            }
        }else
        {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations:{
                
                sender.frame.origin = newFrameOrigin
            }) { [unowned self] (_) in

                let wrongAnswerSide = sender.frame.size.width * 4
                let tempSize:CGSize = CGSize(width: wrongAnswerSide, height: wrongAnswerSide)

                let wrongAnswer = UIImageView()
                wrongAnswer.frame.size = originalFrameSize
                wrongAnswer.frame = self.answerView[self.answerViewLocationFlag].frame
//                wrongAnswer.image = UIImage(named: "x1")
                self.view.addSubview(wrongAnswer)
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                    wrongAnswer.frame.size = tempSize
                    wrongAnswer.frame.origin = originalFrameOrigin
                    sender.frame.origin = originalFrameOrigin
                }, completion: { (_) in
                    wrongAnswer.removeFromSuperview()
                })
            }
        }
    }
    

    
}

