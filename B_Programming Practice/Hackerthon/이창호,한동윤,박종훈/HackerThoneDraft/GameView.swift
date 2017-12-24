//
//  GameView.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/6/17.
//  Copyright © 2017 DY. All rights reserved.
//

import UIKit
import AVFoundation


class GameView: UIView {

    var bgmPlayer:AVPlayer?

    var timer = Timer()
//    var timerForImage = Timer()
    
    var boolTable:[Bool] = []
    var counter:Int = 0 // for counting the number of cells in gameView, numberOfRows * numberOfCols
    
    var colorIndex = 0
    var timerTimeDuration:TimeInterval = 0.0001
    
    var numberOfRows:Int = 20
    var numberOfCols:Int = 20
    var sideScalar:CGFloat?
    
    var direction = ExplodeDirection.chaos
    var duration = Double(3)
    
    var delegate:GameViewDelegate?
    
    var viewArray:[UIView] = []
    
//    var rightAnswerColor:[UIColor] = []
    var firstFlag:Bool = true
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for _ in 0..<numberOfRows
        {
            for _ in 0..<numberOfCols
            {
                let squareCell = UIView()
                squareCell.backgroundColor = .black
                self.viewArray.append(squareCell)
                self.addSubview(squareCell)
            }
        }
        self.boolTable = Array(repeating: true, count: self.numberOfCols * self.numberOfRows)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        var index:Int = 0
//        sideScalar = (self.superview?.frame.width)! / CGFloat(numberOfRows)
        sideScalar = self.frame.width / CGFloat(numberOfRows)
        for squareCell in viewArray
        {
            let x = index % numberOfCols
            let y = index / numberOfCols
            squareCell.layer.borderWidth = 0.4
            squareCell.layer.borderColor = UIColor.black.cgColor
            squareCell.frame = CGRect(x: CGFloat(x) * sideScalar!, y: CGFloat(y) * sideScalar!, width: sideScalar!, height: sideScalar!)
            index += 1
        }
    }
    
    
    func startChange()
    {

        if let gameStartBgm = Bundle.main.url(forResource: "bgm", withExtension: "mp3")
        {
            bgmPlayer = AVPlayer(url: gameStartBgm)
        }
        bgmPlayer?.play()
//        let failForSelection = Bundle.main.url(forResource: "failForSelection", withExtension: "wav")
//        let rightForSelection = Bundle.main.url(forResource: "rightForSelection", withExtension: "wav")
//        let seccessGame = Bundle.main.url(forResource: "seccessGame", withExtension: "wav")
        
//unowneds 는 nil이 되도 되는 객체


        
        timer = Timer.scheduledTimer(withTimeInterval: timerTimeDuration, repeats: true) { [unowned self] (timer1) in
            let randomIndex:Int = Int(arc4random_uniform(UInt32(self.numberOfCols * self.numberOfCols)))
            
            if self.boolTable[randomIndex] == true
            {
//                self.makeAnimatingCell(index: randomIndex)
                self.viewArray[randomIndex].backgroundColor = Colors.level3[self.colorIndex]
//                print(self.viewArray[randomIndex].frame.origin)
                self.counter += 1
                self.boolTable[randomIndex] = false
            }
            
            if self.counter == self.numberOfCols * self.numberOfRows
            {
                self.colorIndex += 1
                self.counter = 0
                self.boolTable = Array(repeating: true, count: self.numberOfCols * self.numberOfRows)
            }
            
//            if self.colorIndex == Colors.level3.count
//            {
//                self.timer.invalidate()
//                self.backgroundColor = .black
//                var imageCounter = 0
//                let imagesStr:[String] = ["playAgain","three1","two1","one1"]
//                self.timerForImage = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (_) in
//                    if imageCounter == 4
//                    {
//                        imageCounter = 0
//                    }else
//                    {
//                        self.delegate?.changeImages(imgString: imagesStr, imgCounter: imageCounter)
//                        imageCounter += 1
//                    }
//                })
//                self.colorIndex += 1
//                self.timer.fire()
//            }
            
            if self.colorIndex >= Colors.level3.count
            {
//                self.timer.invalidate()
//                print("timer ended")
//                self.explode(self.direction, duration: self.duration)
                if self.firstFlag
                {
                    self.delegate?.makeButtonsForAnswer(colors: Colors.level3)
                    self.delegate?.makeAnswerView()
                    self.delegate?.touchFirstButton()
                    self.firstFlag = false
                }
                self.colorIndex = 0
            }
        }
        self.timer.fire()
    }
    
//    func makeAnimatingCell(index:Int)
//    {
//        let squareCell = UIView()
//        squareCell.backgroundColor = .red//self.colors[self.colorIndex]
//        squareCell.layer.borderWidth = 0.4
//        squareCell.layer.borderColor = UIColor.black.cgColor
//        let sideFactor:CGFloat = 2
//        let tempSideScalar = (self.view?.frame.width)! * sideFactor / CGFloat(self.gameView.numberOfRows)
//        
//        let locationFactor:CGFloat = self.view.frame.width / CGFloat((self.colors?.count)!)
//        self.view.addSubview(squareCell)
        //        squareCell.frame = CGRect(x: , y: 300, width: tempSideScalar, height: tempSideScalar)
        //        squareCell.frame = CGRect(x: locationFactor * CGFloat(self.counter % (self.colors?.count)!), y: self.gameView.frame.origin.y - 50, width: tempSideScalar, height: tempSideScalar)
        //        self.view.addSubview(squareCell)
        
        //        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut, .transitionCrossDissolve] , animations: {
        //            squareCell.frame.origin = self.gameView.viewArray[index].frame.origin
        //
        //            squareCell.frame.size = CGSize(width: tempSideScalar / sideFactor, height: tempSideScalar / sideFactor)
        //            print("viewArray: \(index)")
        //        }, completion: { (_) in squareCell.removeFromSuperview() })
        //        
//    }
}

protocol GameViewDelegate
{
    func touchFirstButton()
    func makeButtonsForAnswer(colors: [UIColor])
    func makeAnswerView()
    func changeImages(imgString:[String], imgCounter:Int)
}
