//
//  TestKolodaViewController.swift
//  KolodaTest
//
//  Created by Eunyeong Kim on 2017. 7. 5..
//  Copyright © 2017년 eunyeongkim. All rights reserved.
//

import UIKit
import Koloda


private var numberOfCards: Int = 8


class TestKolodaViewController: UIViewController {
    
    static var sunnyArray:[UIImage] = []
    static var clowdyArray:[UIImage] = []

    @IBOutlet weak var kolodaView: KolodaView!
    
    @IBOutlet weak var titleDate: UILabel!
    
    
    @IBAction func sunnyBtn(_ sender: UIButton) {
        kolodaView.swipe(.left)
    }
    @IBAction func cloudBtn(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }

    
    
    fileprivate var dataSource: [UIImage] = {
        var array: [UIImage] = []
//        var albumImageArray : [UIImage] = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "\(index + 1)")!)
//            array.append(albumImageArray[index])
        }
        return array
        
        //        let scFetchOption = PHFetchOptions()
        //        var scArray:[PHAsset] = []
        //        var scImages = [UIImage]()
        //        let scTargetSize:CGSize = CGSize(width: 200, height: 200)
        //        let scContentMode:PHImageContentMode = PHImageContentMode.aspectFit
        //
        //
        //        let allPhotos = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: scFetchOption)
        //
        //        let query = NSCompoundPredicate(orPredicateWithSubpredicates: [NSPredicate(format: "creationDate")])
        //
        //        allPhotos.countOfAssets(with: PHAssetMediaType.image)
        //
        //        scFetchOption.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        //        scFetchOption.predicate = NSPredicate(format: "%K  = %@", "creationDate","dd")
        //        return scArray

    }()
    
    
    // MARK: RECEIVE DATE
    let today: Date = Date.init()
    var dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.delegate = self
        kolodaView.dataSource = self
        view.addSubview(kolodaView)
        
        // MARK: EUNYEONG DATE
        dateFormatter.dateFormat = "y. M. d."
        titleDate.text = dateFormatter.string(from: today)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.kolodaView.reloadData()
        numberOfCards = dataSource.count
        
    }

    

}


// MARK: KolodaViewDelegate

extension TestKolodaViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
        // MARK: CUSTOM EUNYEONG
        let outOfCardAlert = UIAlertController.init(title: "오늘들을 모두 살펴보셨습니다.", message: nil, preferredStyle: .alert)

        let outOfCardAlertBtn = UIAlertAction.init(title: "내일을 기다릴게요.", style: .default, handler: nil)
        outOfCardAlert.addAction(outOfCardAlertBtn)
        self.present(outOfCardAlert, animated: true, completion: nil)
        
        let outOfStockImg : UIImage = #imageLiteral(resourceName: "outOfStock.png")
//        kolodaView.UIImageView(image: outOfStockImg)
        
        
        
    } //card가 view에서 다 떨어지면 일어날 행동
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //detail view로 이동하는 segue를 삽입하기.
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .left:
            TestKolodaViewController.sunnyArray.append(dataSource[index])
        case .right:
            TestKolodaViewController.clowdyArray.append(dataSource[index])
        default:
            print("did another direction")
        }
        
    }
    
}

// MARK: KolodaViewDataSource

extension TestKolodaViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?.first as? OverlayView
    }
}

