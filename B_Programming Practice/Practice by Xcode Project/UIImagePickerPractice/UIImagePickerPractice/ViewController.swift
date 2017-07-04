//
//  ViewController.swift
//  UIImagePickerPractice
//
//  Created by Bo-Young PARK on 4/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import TLPhotoPicker
import ImagePicker

class ViewController: UIViewController, ImagePickerDelegate {

    
    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /****************************************/
    //           IBOutlet | 전역변수          //
    /****************************************/
    
    @IBOutlet weak var imageView: UIImageView!
    

    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    @IBAction func imageUploadTouched(_ sender: UIButton) {
        
        let imagePickerController:ImagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion:nil)
        
        }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        
    }
        
//    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
//        self.imageView.image = withTLPHAssets.first?.fullResolutionImage
//    }
    
}

