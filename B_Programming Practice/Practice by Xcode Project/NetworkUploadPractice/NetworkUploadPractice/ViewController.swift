//
//  ViewController.swift
//  NetworkUploadPractice
//
//  Created by Bo-Young PARK on 21/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    /*************************************/
    //          IBOutlet | 전역변수         //
    /*************************************/
    
    
    
    /*************************************/
    //          IBAction | Methods        //
    /*************************************/
    
    @IBAction func onLoadImageButtonTouched(_ sender: UIButton) {
        let picker = UIImagePickerController.init()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        DispatchQueue.main.async {
            self.present(picker, animated: true, completion: nil)
        }
 
    }
    
    // Alamofire 를 이용
    func uploadAlamofire(pickedImage:UIImage)
    {
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                
                multipartFormData.append(UIImagePNGRepresentation(pickedImage)!, withName: "test", fileName:"test.jpg", mimeType:"image/jpg")
                //                multipartFormData.append(unicornImageURL, withName: “unicorn”)
                //                multipartFormData.append(rainbowImageURL, withName: “rainbow”)
        },
            to: "http://localhost:1337/upload",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
    }
    
    
    
    // 일반적인 이용
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            /*패킷을 만들어 보죠. 만들려면 뭘 먼저 해야하죠? 리퀘스트 만들어야죠. */
            let url = URL(string: "http://localhost:1337/upload")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            let boundary = "Boundary-\(UUID().uuidString)"
            
            request.setValue("multipart/form-data; charset=utf-8; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            //이제 바디에 pickedImage를 형식에 맞게 넣으면 되죠. 그거에 맞춰서 넣는데
            request.httpBody = createBody(name: "test",
                                          boundary: boundary,
                                          data: UIImageJPEGRepresentation(pickedImage, 0.7)!,
                                          mimeType: "image/jpg",
                                          filename: "hello.jpg")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {return}
                
                print("data:\(data)")
                print("response:\(String(describing:response))")
                print("error:\(String(describing:error))")

            }
            
            task.resume()
        }
    }
    
    func createBody(name : String,
                    boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    
    
    // 캔슬할 때 쓰는거
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*************************************/
    //             Life Cycle            //
    /*************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

extension NSMutableData {
    func appendString(_ str:String) {
        self.append(str.data(using: .utf8)!)
    }
}

