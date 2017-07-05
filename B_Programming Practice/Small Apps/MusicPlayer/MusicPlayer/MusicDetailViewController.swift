//
//  MusicDetailViewController.swift
//  MusicPlayer
//
//  Created by Bo-Young PARK on 4/7/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation


class MusicDetailViewController: UIViewController {
    
    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileName = "\(songData.songID!)"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = AVPlayer(url: url)
        }
        playPlayer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /****************************************/
    //           IBOutlet | 전역변수           //
    /****************************************/
    
    @IBOutlet weak var backBtnOutlet: UIButton!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    
    @IBOutlet weak var previousBtnOutlet: UIButton!
    @IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    
    @IBOutlet weak var randomPlayBtnOutlet: UIButton!
    @IBOutlet weak var shufflePlayBtnOutlet: UIButton!
    
    
    
    private var songData:SongMetaData!
    var player:AVPlayer?
    var indexPathForItem:Int?
    
    var newSongData:SongDataSource = SongDataSource()
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    
    //-----IBActions
    
    //이전화면으로 가기
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        player?.pause()
    }
    
    //이전곡 재생
    @IBAction func previousBtnAction(_ sender: UIButton) {
        if self.randomPlayBtnOutlet.alpha == 0.5 {
            playPreviousSong()
        }else{
            playRandomSong()
        }
    }
    
    //재생, 일시정지
    @IBAction func playBtnAction(_ sender: UIButton) {
        
        //누를때마다 버튼 이미지 play > pause > play 로 바꿔주기
        if self.playBtnOutlet.image(for: .normal) == #imageLiteral(resourceName: "playWhite") {
            self.playBtnOutlet.setImage(#imageLiteral(resourceName: "pauseWhite"), for: .normal)
            player?.play()
        }else{
            self.playBtnOutlet.setImage(#imageLiteral(resourceName: "playWhite"), for: .normal)
            player?.pause()
        }
    }
    
    //다음곡 재생
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if self.randomPlayBtnOutlet.alpha == 0.5 {
            playNextSong()
        }else{
            playRandomSong()
        }
        
    }
    
    //랜덤플레이
    @IBAction func randomPlayAction(_ sender: UIButton) {
        if self.randomPlayBtnOutlet.alpha == 0.5 {
            self.randomPlayBtnOutlet.alpha = 1
            self.previousBtnOutlet.alpha = 1
            self.nextBtnOutlet.alpha = 1
            self.previousBtnOutlet.isUserInteractionEnabled = true
            self.nextBtnOutlet.isUserInteractionEnabled = true
            
        }else{
            self.randomPlayBtnOutlet.alpha = 0.5
        }
    }
    
    
    
    //전체곡반복
    //TODO: 아직 노래재생 시간을 이해하지 못해서 완성하지 못했음
    @IBAction func shufflePlayAction(_ sender: UIButton) {
    }
    
    
    //-----일반함수영역
    
    //SongMetaData 가져오기
    func setSongData(data:SongMetaData) {
        songData = data
    }
    
    //UI업데이트 하기
    func updateUI(data:SongMetaData) {
        songTitleLabel.text = data.songTitle
        artistNameLabel.text = data.artistName
        albumCoverImage.image = data.albumImg
    }
    
    //다음 노래 재생 (Random Icon의 Alpha 값에 따라 달라진다)
    func playNextSong() {
        switch self.randomPlayBtnOutlet.alpha {
        case 0.5:
            if self.indexPathForItem! < newSongData.numberOfItems-1 {
                
                self.nextBtnOutlet.alpha = 1
                self.previousBtnOutlet.alpha = 1
                
                self.previousBtnOutlet.isUserInteractionEnabled = true
                
                if let nextSongData = newSongData.cellForSongData(at: indexPathForItem!+1) {
                    setSongData(data: nextSongData)
                    
                    let fileName = "\(nextSongData.songID!)"
                    if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
                        player = AVPlayer(url: url)
                    }
                    
                    playPlayer()
                    
                    self.indexPathForItem! += 1
                }
            }else{
                
                self.nextBtnOutlet.alpha = 0.5
                self.previousBtnOutlet.isUserInteractionEnabled = false
                
                let alert:UIAlertController = UIAlertController(title: "알림", message: "마지막 곡입니다", preferredStyle: .alert)
                let doneBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: { (self) in
                    print("알람이 실행되었당")
                })
                
                alert.addAction(doneBtn)
                self.present(alert, animated: true, completion: nil)
            }
        case 1:
            playRandomSong()
        default:
            break
        }
    }
    
    //이전 노래 재생 (Random Icon의 Alpha 값에 따라 달라진다)
    func playPreviousSong() {
        switch self.randomPlayBtnOutlet.alpha {
        case 0.5:
            if self.indexPathForItem! != 0 {
                
                self.previousBtnOutlet.alpha = 1
                self.nextBtnOutlet.alpha = 1
                
                self.previousBtnOutlet.isUserInteractionEnabled = true
                
                if let nextSongData = newSongData.cellForSongData(at: indexPathForItem!-1) {
                    setSongData(data: nextSongData)
                    
                    let fileName = "\(nextSongData.songID!)"
                    if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
                        player = AVPlayer(url: url)
                    }
                    
                    playPlayer()
                    self.indexPathForItem! -= 1
                }
            }else{
                self.previousBtnOutlet.alpha = 0.5
                self.previousBtnOutlet.isUserInteractionEnabled = false
                
                let alert:UIAlertController = UIAlertController(title: "알림", message: "첫 번째 곡입니다", preferredStyle: .alert)
                let doneBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: { (self) in
                    print("알람이 실행되었당")
                })
                
                alert.addAction(doneBtn)
                self.present(alert, animated: true, completion: nil)
            }
        case 1:
            playRandomSong()
        default:
            break
        }
        
    }
    
    //랜덤 곡 리스트 생성 후 재생
    func playRandomSong() {
        
        let numberOfSong = UInt32(self.newSongData.numberOfItems)
        let randomSongIndex = Int(arc4random_uniform(numberOfSong))
        let randomSongData = newSongData.cellForSongData(at: randomSongIndex)
        setSongData(data: randomSongData!)
        self.indexPathForItem = randomSongIndex
        
        let fileName = "\(randomSongData!.songID!)"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = AVPlayer(url: url)
        }
        playPlayer()
        
    }
    
    //플레이어 실행
    func playPlayer() {
        player?.play()
        updateUI(data: self.songData)
    }
    
}
