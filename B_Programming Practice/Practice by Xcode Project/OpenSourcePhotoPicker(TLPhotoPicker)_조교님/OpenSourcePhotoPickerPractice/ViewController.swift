//
//  ViewController.swift
//  OpenSourcePhotoPickerPractice
//
//  Created by 박종찬 on 2017. 7. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit
import ImagePicker
import TLPhotoPicker


class ViewController: UIViewController,TLPhotosPickerViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        let imagePickerController: TLPhotosPickerViewController = TLPhotosPickerViewController.init()
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.imageView.image = withTLPHAssets.first!.fullResolutionImage
    }
    
}

