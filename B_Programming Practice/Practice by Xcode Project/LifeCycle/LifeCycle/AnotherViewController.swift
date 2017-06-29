//
//  AnotherViewController.swift
//  LifeCycle
//
//  Created by 박종찬 on 2017. 6. 8..
//  Copyright © 2017년 박종찬. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {
    
    override func awakeFromNib() {
        //Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
        //인터페이스 빌더 아카이브나 닙파일로부터 리시버(여기서는 뷰컨트롤러)가 로드된 이후 서비스를 준비합니다.
        
        print("awakeFromNib -                   두번째 뷰가 Nib에서 깨어났습니다.")
    }
    
    //    override func loadView() {
    //        // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
    //        // 이 곳은 닙을 사용하지 않을 시 서브클래스들이 각각의 커스텀 뷰 하이어라키를 생성해야 하는 곳입니다. 수동으로 불려져서는 안됩니다.
    //        super.loadView()
    //        print("loadView")
    //    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        // 일반적으로 닙으로부터 로딩되는 경우에 어떤 추가적인 설정이 필요하다면 여기서 하세요.
        super.viewDidLoad()
        print("viewDidLoad -                    두번째 뷰가 로드되었습니다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Called when the view is about to made visible. Default does nothing.
        // 뷰가 보여지기 직전에 호출됩니다. 기본적으로는 아무 것도 안합니다.
        print("viewWillAppear -                 두번째 뷰가 나타날 예정입니다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Called when the view has been fully transitioned onto the screen. Default does nothing.
        // 뷰가 스크린에 완전히 트랜지션된 후에 불립니다. 기본적으로는 아무 것도 안합니다.
        print("viewDidAppear -                  두번째 뷰가 완전히 나타난 직후입니다.")
        print("---------------------------------------------------------------------")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Called when the view is dismissed, covered or otherwise hidden. Default does nothing.
        // 뷰가 사라지거나(dismiss) 덮이거나(cover) 숨겨지는(hidden) 때에(when) 불립니다. 기본적으로는 아무 것도 안합니다.
        print("viewWillDisappear -              두번째 뷰가 사라질 예정입니다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
        // 뷰가 사라지거나(dismiss) 덮이거나(cover) 숨겨진(hidden) 후에(after) 불립니다. 기본적으로는 아무 것도 안합니다.
        print("viewDidDisappear -               두번째 뷰가 사라진 직후입니다.")
        print("---------------------------------------------------------------------")
    }
    
    override func viewWillLayoutSubviews() {
        // Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
        // 뷰컨트롤러의 layoutSubviews 메서드가 호출되기 직전에 불립니다. 서브클래스에서 필요에 따라 구현할 수 있습니다. 기본적으로는 아무것도 안합니다.
        print("viewWillLayoutSubviews -         두번째 뷰가 서브뷰 레이아웃을 잡기 직전입니다.")
    }
    
    
    override func viewDidLayoutSubviews() {
        // Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
        // 뷰컨트롤러의 layoutSubviews 메서드가 호출된 직후에 불립니다. 서브클래스에서 필요에 따라 구현할 수 있습니다. 기본적으로는 아무것도 안합니다.
        print("viewDidLayoutSubviews -          두번째 뷰가 서브뷰 레이아웃을 잡은 직후입니다.")
    }
    
    @IBAction func dismissButtonTouched(_ sender: UIButton) {
        print("dismissButtonTouched -           두번째 뷰에서 디스미스 버튼이 터치되었습니다.")
        print("---------------------------------------------------------------------")
        self.dismiss(animated: true, completion: nil)
    }
}
