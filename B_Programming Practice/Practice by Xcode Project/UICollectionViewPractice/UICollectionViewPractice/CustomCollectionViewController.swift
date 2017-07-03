//
//  CustomCollectionViewController.swift
//  UICollectionViewPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CustomCollectionViewController: UICollectionViewController {
    
    /*********************************************/
    //                  LiftCycle                 //
    /*********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //여러개의 cell을 선택/선택해제 할 수 있게 해준다.
        self.collectionView?.allowsMultipleSelection = true
        
        //이거슨 UICollectionView 만의 특권
        self.installsStandardGestureForInteractiveMovement = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBOutlet weak var duplicateBtnOutlet: UIButton!
    
    /*********************************************/
    //             IBAction | Methods            //
    /*********************************************/
    //----- IBAction
    
    @IBAction func duplicateActionBtn(_ sender: UIButton) {
        
        self.collectionView?.performBatchUpdates({
            
            if let indexPathItems = self.collectionView?.indexPathsForSelectedItems {
                
                //Data Update
                DataCenter.center.insertItems(at:indexPathItems)
                
                //UI Update
                self.collectionView?.insertItems(at: indexPathItems)
                
            }
        }, completion: nil)
        
    }
    
    
    //----- CollectionView DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataCenter.center.friendsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.set(title: DataCenter.center.friendsList[indexPath.item])
        // cell.set(image: DataCenter.center.friendsImage[indexPath.item])
        
        
        return cell
    }
    
    //----- CollectionView Delegate
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .gray
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = nil
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(self.collectionView?.indexPathsForSelectedItems)
    }
    
    //----- Cell Move (CollectionViewController로 하지 않고 일반 ViewController에 CollectionView를 올렸을 때)
    /*
     self.installsStandardGestureForInteractiveMovement = true 이 놈이 CollectionViewController의 특권이기 때문에,
     일반 ViewController에 CollectionView를 쓴 후, 제스처를 먹이려면,
     제스처를 올린 다음에 하기와 같은 함수를 입력해주어야 한다.
     */
    
    func handleLongGesture(gesture:UILongPressGestureRecognizer) {
        switch(gesture.state) {
        case .began:
            guard let selectedIndexPath = self.collectionView?.indexPathForItem(at: gesture.location(in: self.collectionView)) else {
                break
            }
            print("began")
            collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
            
        case .changed:
            collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
            print("move")
        case .ended:
            collectionView?.endInteractiveMovement()
            print("end")
        default:
            collectionView?.cancelInteractiveMovement()
        }
    }
    
    override func collectionView(_ collectionView:UICollectionView, moveItemAt sourceIndexPath:IndexPath, to destinationIndexPath:IndexPath) {
        
        let movedStr = DataCenter.center.friendsList.remove(at: sourceIndexPath.item)
        DataCenter.center.friendsList.insert(movedStr, at: destinationIndexPath.item)
    }
    
    
    
}
