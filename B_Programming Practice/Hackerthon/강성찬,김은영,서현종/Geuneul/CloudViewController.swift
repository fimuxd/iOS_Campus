//
//  CloudViewController.swift
//  Geuneul
//
//  Created by Eunyeong Kim on 2017. 7. 6..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class CloudViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var cloudyCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cloudyCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TestKolodaViewController.clowdyArray.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CloudyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CloudyCell", for: indexPath) as! CloudyCollectionViewCell
        
        cell.cloudyImgView.image =  TestKolodaViewController.clowdyArray[indexPath.item]
        
        return cell
    }
    


}
