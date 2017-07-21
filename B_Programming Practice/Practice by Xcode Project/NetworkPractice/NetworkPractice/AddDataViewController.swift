//
//  AddDataViewController.swift
//  NetworkPractice
//
//  Created by Bo-Young PARK on 20/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddDataViewController: UIViewController {
    
    /* Add를 추가해보세요. 스스로 구현해보세요. POST를 이용해서 */
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func postButtonAction(_ sender: UIButton) {
        createUserData(id: self.emailTextField.text!, pw: self.nameTextField.text!, name: self.nameTextField.text!)
    }
    
    
    /*******************************/
    //  Alamofire 로 네트워크 연결하기  //
    /*******************************/
    
    func createUserData(email: String, password:String, name:String) {
        let params = ["email": email, "password":password, "name":name]
        
        Alamofire.request("http://localhost:1337/user", method: .post,)
        
    }
    
    
    
    /*******************************/
    // 기본 iOS 내장으로 네트워크 연결하기 //
    /*******************************/
    
//    func createUserData(id:String, pw:String, name:String) {
//        let url = URL(string: "http://localhost:1337/user")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        
//        //        let param = [
//        //            "email" = id,
//        //            "password" = pw,
//        //            "name" = name
//        //        ]
//        //
//        //        if let jsonStr = try? JSONSerialization.data(withJSONObject: param, options: .init(rawValue:0)) {
//        //            let url = URL(string: "http://localhost:1337/user")
//        //            var request = URLRequest(url: url!)
//        //            request.httpMethod = "POST"
//        //            request.httpBody = jsonStr
//        //            request.setValue("application/json", forHTTPHeaderField:"Content-Type")
//        //
//        //        let task = URLSession.shared.dataTask(with: request) {
//        //            data, response, error in
//        //            guard let data = data else {return}
//        //
//        //            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> {
//        //                self.refreshTableView()
//        //            }
//        //        }
//        //          task.resume()
//        //        }
//        //
//        
//        let body = NSMutableData()
//        body.appendString("{\"email\":\"\(id)\", \"password\":\"\(pw)\", \"name\":\"\(name)\"}")
//        request.httpBody = body as Data
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        debugPrint(String.init(data: request.httpBody!, encoding: .utf8))
//        
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            guard let data = data else {return}
//            print(response)
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> {
//                print(json)
//            }
//            
//        }
//        task.resume()
//        
//    }
    
//    func refrshTableView() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
