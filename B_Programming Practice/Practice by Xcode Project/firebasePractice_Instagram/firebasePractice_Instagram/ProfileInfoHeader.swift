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

    let photoButton:UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        
        return button
    }()
    
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
    
    let editProfileButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(editActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        return button

    }()
    
    let profileTextLable:UILabel = {
        let profileTextLable:UILabel = UILabel()
        profileTextLable.text = "fimuxd\nLife is a game. Play it :)"
        profileTextLable.font = UIFont(name: profileTextLable.font.fontName, size: 15)
        profileTextLable.numberOfLines = 0
        
        return profileTextLable
    }()
    
    let gridTypeButton:UIButton = {
        let gridTypeButton:UIButton = UIButton(type: .system)
        gridTypeButton.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        
        gridTypeButton.addTarget(self, action: #selector(gridActionHandle), for: .touchUpInside)
        gridTypeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return gridTypeButton
    }()
    
    let listTypeButton:UIButton = {
        let listTypeButton:UIButton = UIButton(type: .system)
        listTypeButton.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        
        listTypeButton.addTarget(self, action: #selector(listActionHandle), for: .touchUpInside)
        listTypeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return listTypeButton
    }()
    
    let ribbonButton:UIButton = {
        let ribbonButton:UIButton = UIButton(type: .system)
        ribbonButton.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        
        ribbonButton.addTarget(self, action: #selector(ribbonActionHandle), for: .touchUpInside)
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
        stackView.spacing = 5
        
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
        grayColorView.backgroundColor = .gray
       
        return grayColorView
    }()
    
    /********************************************/
    //                  method                   //
    /********************************************/
    
    func editActionHandle() {
        
    }
    
    func gridActionHandle() {
        
        print("버튼눌림")
        gridTypeButton.alpha = 1
        listTypeButton.alpha = 0.2
        ribbonButton.alpha = 0.2
        
    }
    
    func listActionHandle() {
    listTypeButton.alpha = 1
        gridTypeButton.alpha = 0.2
        ribbonButton.alpha = 0.2
    }
    
    func ribbonActionHandle() {
        listTypeButton.alpha = 1
        gridTypeButton.alpha = 0.2
        ribbonButton.alpha = 0.2
    }
    
    
    fileprivate func setUpSubViewsLayout() {

        photoButton.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: totalStackView.frame.height, height: totalStackView.frame.height, centerX: nil, centerY: nil)
        
        labelsAndEditStackView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width-55-(frame.height-55)/2, height: 0, centerX: nil, centerY: nil)
        
        totalStackView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 30, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-55)/2, centerX: centerXAnchor, centerY: nil)
        
        profileTextLable.anchor(top: totalStackView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 2, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-20)/4, centerX: centerXAnchor, centerY: nil)
        
        grayColorView.anchor(top: nil, left: nil, right: nil, bottom: buttonsStackView.topAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: 1, centerX: nil, centerY: nil)
        
        buttonsStackView.anchor(top: nil, left: nil, right: nil, bottom: self.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: 50, centerX: nil, centerY: nil)
        
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
        
        buttonsStackView.addArrangedSubViews([gridTypeButton, listTypeButton, ribbonButton])
        
        addSubview(totalStackView)
        addSubview(profileTextLable)
        addSubview(grayColorView)
        addSubview(buttonsStackView)
        
        setUpSubViewsLayout()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
