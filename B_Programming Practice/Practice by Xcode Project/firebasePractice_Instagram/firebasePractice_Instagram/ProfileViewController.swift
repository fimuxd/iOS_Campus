//
//  ProfileViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 25/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Firebase

/********************************************/
//                  전역변수                   //
/********************************************/
private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "Header"
let profileInfoHeader:ProfileInfoHeader = ProfileInfoHeader()


class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if DataCenter.sharedData.isLogin && userData == nil {
            DataCenter.sharedData.requestUserData(completion: {(user) in
                self.userData = user })
        }
        
    }
    
    var userData:User?{
        //실제 데이터가 들어왔을 때 어떤 행동을 할지 적어주는 것
        didSet{
            self.collectionView?.reloadData()
            self.navigationItem.title = userData?.email
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation Setting
        let settingButton = UIBarButtonItem(image: #imageLiteral(resourceName: "gear"), style: .plain, target: self, action: #selector(handlerSetting))
        self.navigationItem.rightBarButtonItem = settingButton
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.register(ProfileInfoHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView?.backgroundColor = .white
        
        
    }
    
    
    func handlerSetting() {
        print("setting")
        
        //LogOut 구현
        do {
            try Auth.auth().signOut()
            //로그아웃 후에는 로그인 화면을 띄워야 하는데, 이것은 자신의 부모인 tabbar controller에게 요청하는 것이 가장 좋다.
            let tabBar:MainTabBarViewController? = self.tabBarController as? MainTabBarViewController
            tabBar?.showLogInVC()
            tabBar?.selectedViewController = tabBar?.viewControllers?[0]
            
        }catch{
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

//CollectionView 설정 부분
extension ProfileViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .gray
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell:ProfileInfoHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! ProfileInfoHeader
        
        cell.backgroundColor = .white
        
        if let userData = self.userData {
            cell.user = userData
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 220)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width-2)/3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}





