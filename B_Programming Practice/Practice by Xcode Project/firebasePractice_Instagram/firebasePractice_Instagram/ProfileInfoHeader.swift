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
        button.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.5)
        button.setImage(#imageLiteral(resourceName: "add_profile"), for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        
        return button
    }()
    
    let postCountLabel:UILabel = {
        let postCountLabel:UILabel = UILabel()
        postCountLabel.text = "0"
        postCountLabel.font = UIFont.boldSystemFont(ofSize: 11)
        return postCountLabel
    }()
    
    let postTitleLabel:UILabel = {
        let postTitleLabel:UILabel = UILabel()
        postTitleLabel.text = "posts"
        postTitleLabel.font = UIFont(name: postTitleLabel.font.fontName, size: 11)
        postTitleLabel.textColor = .gray
        
        return postTitleLabel
    }()
    
    let followersCountLabel:UILabel = {
        let followersCountLabel:UILabel = UILabel()
        followersCountLabel.text = "0"
        followersCountLabel.font = UIFont.boldSystemFont(ofSize: 11)
        
        return followersCountLabel
    }()
    
    let followersTitleLabel:UILabel = {
        let followersTitleLabel:UILabel = UILabel()
        followersTitleLabel.text = "followers"
        followersTitleLabel.font = UIFont(name: followersTitleLabel.font.fontName, size: 11)
        followersTitleLabel.textColor = .gray
        
        return followersTitleLabel
    }()
    
    let followingCountLabel:UILabel = {
        let followingCountLabel:UILabel = UILabel()
        followingCountLabel.text = "0"
        followingCountLabel.font = UIFont.boldSystemFont(ofSize: 11)
        
        return followingCountLabel
    }()
    
    let followingTitleLabel:UILabel = {
        let followingTitleLabel:UILabel = UILabel()
        followingTitleLabel.text = "following"
        followingTitleLabel.font = UIFont(name: followingTitleLabel.font.fontName, size: 11)
        followingTitleLabel.textColor = .gray
        
        return followingTitleLabel
    }()
    
    let editProfileButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(editActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        
        return button

    }()
    
    let profileTextLable:UILabel = {
        let profileTextLable:UILabel = UILabel()
        profileTextLable.text = "fimuxd"
        
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
    
    let postLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 1
        
        return stackView
    }()
    
    let followersLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 1
        
        return stackView
    }()

    let followingLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 1
        
        return stackView
    }()
    
    let topLabelStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        return stackView
    }()
    
    let labelsAndEditStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        return stackView
    }()
    
    let leftAndRightStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
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
    
    let grayColorView:UIImageView = {
        let grayColorView:UIImageView = UIImageView()
        grayColorView.backgroundColor = .gray
       
        return grayColorView
    }()
    
    let grayAndButtonsStackView:UIStackView = {
        let grayAndButtonsStackView:UIStackView = UIStackView()
        grayAndButtonsStackView.axis = .vertical
        grayAndButtonsStackView.distribution = .fill
//        grayAndButtonsStackView.spacing = 
        
        return grayAndButtonsStackView
    }()
    
    /********************************************/
    //                  method                   //
    /********************************************/
    
    func editActionHandle() {
        
    }
    
    func gridActionHandle() {
        
    }
    
    func listActionHandle() {
        
    }
    
    func ribbonActionHandle() {
        
    }
    
    fileprivate func setUpSubViewsLayout() {

        photoButton.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width*1/6, height: frame.width*1/6, centerX: nil, centerY: nil)
        
        labelsAndEditStackView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width*3/4, height: photoButton.frame.height, centerX: nil, centerY: nil)
        
        leftAndRightStackView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 30, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-30)/2, centerX: centerXAnchor, centerY: nil)
        
        profileTextLable.anchor(top: leftAndRightStackView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: nil, topConstant: 5, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: (frame.height-20)/4, centerX: centerXAnchor, centerY: nil)
        
        buttonsStackView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: grayAndButtonsStackView.frame.height*4/5, centerX: nil, centerY: nil)
        
        grayAndButtonsStackView.anchor(top: profileTextLable.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 5, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: frame.width, height: 0, centerX: centerXAnchor, centerY: nil)
        
        
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
        
        leftAndRightStackView.addArrangedSubViews([photoButton, labelsAndEditStackView])
        
        buttonsStackView.addArrangedSubViews([gridTypeButton, listTypeButton, ribbonButton])
        grayAndButtonsStackView.addArrangedSubViews([grayColorView, buttonsStackView])
        
        addSubview(leftAndRightStackView)
        addSubview(profileTextLable)
        addSubview(grayAndButtonsStackView)
        
        setUpSubViewsLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
