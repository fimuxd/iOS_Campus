//
//  PhotoCollectionViewController.swift
//  StartRealm
//
//  Created by Mijeong Jeon on 21/03/2017.
//  Copyright © 2017 Jo Seong Gyu. All rights reserved.
//

import UIKit
// 0. import RealmSwift

class PhotoCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    // 1. realm, seldectedAlbum, photos properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. Realm init
       
        // 2. 선택된 앨범의 사진 리스트 가져오기(사진 최신순 정렬)
       
        // 3. Navigation title = selectedAlbum title
        
        // 8. Realm Notigication - collectoinView reload
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // 4. collectionView item 수 = 앨범 내 사진 개수
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        // 5. collectionView item image 설정

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        alertToDelete(selectedIndexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.size.width - 10)/3
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    // MARK: ImagePickerView 사진 추가
    @IBAction func addImage(_ sender: UIBarButtonItem) {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.sourceType = .photoLibrary
        
        self.present(imagePickerView, animated: true) { }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 6. 선택된 사진 저장
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 사진 삭제
    func alertToDelete(selectedIndexPath: IndexPath) {
        // 7. 선택된 사진 삭제 알럿트
        
    }
}
