//
//  MainViewController.swift
//  MusicPlayer
//
//  Created by Bo-Young PARK on 4/7/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /****************************************/
    //MARK: //      LifeCycle               //
    /****************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let insetSide = collectionView.bounds.size.width/4
        
        coverViewLayout.sectionInset = UIEdgeInsetsMake(0, insetSide, 0, insetSide)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /****************************************/
    //MARK: //   IBOutlet | 전역변수           //
    /****************************************/
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var coverViewLayout: CoverFlowLayout!
    
    let dataSource = SongDataSource()
    
    /****************************************/
    //MARK: //   IBAction | Methods          //
    /****************************************/
    
    
    @IBAction func randomPlayAction(_ sender: UIButton) {
        
        if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController {
            let numberOfSong = UInt32(dataSource.numberOfItems)
            let randomSongIndex = Int(arc4random_uniform(numberOfSong))
            let randonSongMetaData = self.dataSource.cellForSongData(at: randomSongIndex)
            
            nextViewController.indexPathForItem = Int(randomSongIndex)
            nextViewController.setSongData(data: randonSongMetaData!)
            
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    
    
    //-----UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        if let newData = dataSource.cellForSongData(at: indexPath.item) {
            cell.setSongData(newData)
        }
        
        return cell
        
    }
    
    //UICollectionViewDelegateFlowLayout 을 상속 받았기 때문에 사용가능함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width/2
        let height = collectionView.bounds.size.height/2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController {
            //nextViewController에 데이터 넣기
            
            let cell:CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
            nextViewController.indexPathForItem = indexPath.item
            
            nextViewController.setSongData(data: cell.songData!)
            
            //화면전환
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
