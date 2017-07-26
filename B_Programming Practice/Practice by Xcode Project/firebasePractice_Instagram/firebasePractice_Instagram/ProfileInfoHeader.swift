//
//  ProfileInfoHeader.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 25/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ProfileInfoHeader: UICollectionViewCell {
    /********************************************/
    //                  전역변수                   //
    /********************************************/
    
    var user:User?{
        didSet{
            profileTextLabel.text = user?.userName
            
            if let urlStr = user?.userProfileImgUrl,
                let url = URL(string: urlStr) {
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    let response = response as? HTTPURLResponse
//                    response.statusCode
//                    guard let error = error else {return}
                    guard let realData = data else {return}
                    
                    DispatchQueue.main.async {
                        self.photoButton.setImage(UIImage(data: realData), for: .normal)
                    }
                    
                    
                }.resume()
            }
            
            //            profileImageView.image = ??
        }
    }
    
    
    
    
    
    //-----Data
    //PhotoButton 부분
    let photoButton:UIButton = {
        let button = UIButton()
//        button.clipsToBounds = true
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
//        button.isEnabled = false
        button.isUserInteractionEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        
        return button
    }()
    
    //PostLabel 부분
    let postCountLabel:UILabel = {
        let postCountLabel:UILabel = UILabel()
        postCountLabel.text = "691"
        postCountLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return postCountLabel
    }()
    
    let postTitleLabel:UILabel = {
        let postTitleLabel:UILabel = UILabel()
        postTitleLabel.text = "posts"
        postTitleLabel.font = UIFont(name: postTitleLabel.font.fontName, size: 15)
        postTitleLabel.textColor = .gray
        
        return postTitleLabel
    }()
    
    //FollowER 부분
    let followersCountLabel:UILabel = {
        let followersCountLabel:UILabel = UILabel()
        followersCountLabel.text = "168"
        followersCountLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        return followersCountLabel
    }()
    
    let followersTitleLabel:UILabel = {
        let followersTitleLabel:UILabel = UILabel()
        followersTitleLabel.text = "followers"
        followersTitleLabel.font = UIFont(name: followersTitleLabel.font.fontName, size: 15)
        followersTitleLabel.textColor = .gray
        
        return followersTitleLabel
    }()
    
    //FollowING 부분
    let followingCountLabel:UILabel = {
        let followingCountLabel:UILabel = UILabel()
        followingCountLabel.text = "106"
        followingCountLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        return followingCountLabel
    }()
    
    let followingTitleLabel:UILabel = {
        let followingTitleLabel:UILabel = UILabel()
        followingTitleLabel.text = "following"
        followingTitleLabel.font = UIFont(name: followingTitleLabel.font.fontName, size: 15)
        followingTitleLabel.textColor = .gray
        
        return followingTitleLabel
    }()
    
    //EditButton 부분
    let editProfileButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(ProfileViewController.editActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        return button
        
    }()
    
    //ProfileTextLabel부분
    let profileTextLabel:UILabel = {
        let profileTextLabel:UILabel = UILabel()
        profileTextLabel.text = "fimuxd\nLife is a game. Play it :)"
        profileTextLabel.font = UIFont(name: profileTextLabel.font.fontName, size: 15)
        profileTextLabel.numberOfLines = 0
        
        return profileTextLabel
    }()
    
    let gridTypeButton:UIButton = {
        let gridTypeButton:UIButton = UIButton(type: .system)
        gridTypeButton.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        
        gridTypeButton.addTarget(self, action: #selector(ProfileViewController.gridActionHandle), for: .touchUpInside)
        gridTypeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return gridTypeButton
    }()
    
    let listTypeButton:UIButton = {
        let listTypeButton:UIButton = UIButton(type: .system)
        listTypeButton.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        
        listTypeButton.addTarget(self, action: #selector(ProfileViewController.listActionHandle), for: .touchUpInside)
        listTypeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return listTypeButton
    }()
    
    let ribbonButton:UIButton = {
        let ribbonButton:UIButton = UIButton(type: .system)
        ribbonButton.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        
        ribbonButton.addTarget(self, action: #selector(ProfileViewController.ribbonActionHandle), for: .touchUpInside)
        ribbonButton.translatesAutoresizingMaskIntoConstraints = false
        
        return ribbonButton
    }()
    
    //-----StackView 영역
    let postLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        //        stackView.spacing = 1
        
        return stackView
    }()
    
    let followersLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        //        stackView.spacing = 1
        
        return stackView
    }()
    
    let followingLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        //        stackView.spacing = 1
        
        return stackView
    }()
    
    // Label Stack * 3
    let topLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        return stackView
    }()
    
    // LabelStack + EditButton
    let labelsAndEditStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    // Total Stack
    let totalStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        
        return stackView
    }()
    
    let buttonsStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.layer.borderColor = UIColor.gray.cgColor
        stackView.layer.borderWidth = 1
        
        return stackView
    }()
    
    let grayColorView:UIView = {
        let grayColorView:UIView = UIView()
        grayColorView.backgroundColor = UIColor.rgbColor(230, 230, 230, 1)
        
        return grayColorView
    }()
    
    /********************************************/
    //                  method                   //
    /********************************************/
    
    fileprivate func setUpSubViewsLayout() {
        
        photoButton.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: totalStackView.frame.height, height: totalStackView.frame.height, centerX: nil, centerY: nil)
        
        labelsAndEditStackView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width-55-(frame.height-55)/2, height: 0, centerX: nil, centerY: nil)
        
        totalStackView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 30, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-55)/2, centerX: centerXAnchor, centerY: nil)
        
        profileTextLabel.anchor(top: totalStackView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 5, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-20)/4, centerX: centerXAnchor, centerY: nil)
        
        grayColorView.anchor(top: nil, left: nil, right: nil, bottom: buttonsStackView.topAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: 1, centerX: nil, centerY: nil)
        
        buttonsStackView.anchor(top: nil, left: nil, right: nil, bottom: self.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: 40, centerX: nil, centerY: nil)
        
        photoButton.layer.cornerRadius = (frame.height-55)/2/2
        
    }
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        postLabelStackView.addArrangedSubViews([postCountLabel, postTitleLabel])
        followersLabelStackView.addArrangedSubViews([followersCountLabel, followersTitleLabel])
        followingLabelStackView.addArrangedSubViews([followingCountLabel, followingTitleLabel])
        
        topLabelStackView.addArrangedSubViews([postLabelStackView, followersLabelStackView, followingLabelStackView])
        
        labelsAndEditStackView.addArrangedSubViews([topLabelStackView, editProfileButton])
        
        totalStackView.addArrangedSubViews([photoButton, labelsAndEditStackView])
        
        
        listTypeButton.alpha = 0.2
        ribbonButton.alpha = 0.2
        buttonsStackView.addArrangedSubViews([gridTypeButton, listTypeButton, ribbonButton])
        
        addSubview(totalStackView)
        addSubview(profileTextLabel)
        addSubview(grayColorView)
        addSubview(buttonsStackView)
        
        photoButton.clipsToBounds = true
        
        setUpSubViewsLayout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileViewController {
    
    //ProfileInfoHeader 부분 버튼 함수
    func editActionHandle() {
        print("edit 버튼눌림")
    }
    
    func gridActionHandle() {
        print("grid 버튼눌림")
        profileInfoHeader.gridTypeButton.alpha = 1
        profileInfoHeader.listTypeButton.alpha = 0.2
        profileInfoHeader.ribbonButton.alpha = 0.2
    }
    
    func listActionHandle() {
        print("list 버튼눌림")
        profileInfoHeader.listTypeButton.alpha = 1
        profileInfoHeader.gridTypeButton.alpha = 0.2
        profileInfoHeader.ribbonButton.alpha = 0.2
    }
    
    func ribbonActionHandle() {
        print("ribbon 버튼눌림")
        profileInfoHeader.listTypeButton.alpha = 1
        profileInfoHeader.gridTypeButton.alpha = 0.2
        profileInfoHeader.ribbonButton.alpha = 0.2
    }
    
    
}

