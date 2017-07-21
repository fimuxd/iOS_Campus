//
//  ViewController.swift
//  NetworkPractice
//
//  Created by Bo-Young PARK on 20/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*******************************/
    //  Alamofire 로 네트워크 연결하기  //
    /*******************************/
    
    var data:JSON = JSON.init(rawValue: [])!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchUserData() {
        Alamofire.request("http://localhost:1337/user").responseJSON { (response) in
            
            //            debugPrint(response)
            //            print(response.result.value)
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.refreshTableView()
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
        let email = self.data[indexPath.row]["email"].stringValue
        let password = self.data[indexPath.row]["password"].stringValue
        cell.textLabel?.text = email
        cell.detailTextLabel?.text = password
        
        return cell
        
    }
    
    
    
    
    /*******************************/
    // 기본 iOS 내장으로 네트워크 연결하기 //
    /*******************************/
    //
    //
    //    //전역변수 하나 만들게요. 데이터 받을 Array
    //    var data = NSMutableArray() //Mutable이 붙어야 데이터 추가/변경이 가능해요. 근데 여기선 그냥 Array를 써도 될 것 같긴 하네요.
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        fetchUserData()
    //
    //        /*프로그래머는 반복되는 코드를 혐오해야 합니다. 그래서 애초에 ViewDidLoad에 구현했던 걸 함수로 만들고 이 함수를 ViewDidLoad와 Refresh에 넣어서 써보겠습니다.
    //
    //         let url = URL(string: "http://localhost:1337/user")
    //         var request = URLRequest(url: url!)
    //         request.httpMethod = "GET"
    //
    //         /* iOS는 네트워크를 작업의 한 종류로 취급해서, 우리가 request를 만든다는 것은 request packet을 만드는거잖아요.
    //         만들기만 하면 되나요? 패킷을 10000개를 보내도 보내야 되요.
    //         그래서 여기서는 data task를 만듭니다 */
    //         let task = URLSession.shared.dataTask(with: request) {
    //
    //         /* 그리고 이 data task에는 컴플리션 핸들러를 붙일 수 있어요. 이 컴플리션 핸들러 이 안에는 뭐가 있겠어요?
    //         request 썼어. 그리고 컴플리션 핸들러가 왔다는건, 리퀘스트를 보내고 리스폰스를 받았다는 거잖아요.
    //         그래서 리스폰스에 대한 파라미터가 필요해요. 여기서는 3가지 입니다. */
    //         data, response, error in
    //
    //         /* data는 바이너리입니다. 이건 바디예요. 바디는 잘라서 줬어요. 양심이 있는거예요. 아예 통째로 주면 어떻게 해요.
    //         response는 바디를 제외한 나머지 부분이예요. 리스폰스에도 헤더랑 여러가지 있잖아요. 그 내용이 리스폰스 안에 들어있습니다.
    //         만약에 리스폰스 안을 보고 싶으면 response를 보면 됩니다.
    //         error는 관련 error가 나올 떄 나오는 거겠죠. 저쪽에서 에러를 보내거나, 비행기 모드거나 등등
    //         일단은 data를 한번 출력해 볼게요. */
    //
    //         /* 여러분 다잉메시지가 중요해요. "App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.fatal error: unexpectedly found nil while unwrapping an Optional value"
    //         일시적으로 예외는 설정될 수 있습니다. 당신 어플의 info.plist를 통해 일시적으로 설정을 확인할 수 있대요.
    //         info.plist에서 App Transport Security Settings 추가. dictionary이므로 내부에 Allow Arbitrary Loads를 YES(true)로 바꿔줌. 그런 다음에 실행하면 뻑 안 남 */
    //         //            print("data : \(String(describing:String.init(data:data!, encoding:.utf8)))")
    //         //            print("response : \(String(describing:response))")
    //         //            print("error : \(String(describing:error))")
    //
    //         /* 우리가 지금 주고 받는 데이터 형식이 JSON이죠. JSON parsing 해야 하는데, 다행히도 string JSON을 자동적으로 객체로 바꾸어주는 애가 있어요. 근데 되게 구립니다.
    //         그래서 실무에선 안써요. 그렇지만 이런걸 써봐야 좋은걸 알거든요. 안좋은걸 써봐야 좋은 것의 의미를 압니다. 그래서 안좋은걸 한번 써보겠습니다.
    //         아까 스트링을 따로 따겠습니다. */
    //
    //         guard let data = data else { return } //이걸 쓰면 data 뒤에 ! 쓸필요 없죠.
    //
    //         let dataString = String.init(data: data, encoding: .utf8)
    //
    //         //            print(dataString)
    //
    //         /* JSON을 parsing 하는 함수는, JSONSerialization 하는 클래스가 있어요. JSONSerialization은 JSON을 기본 객체로 변환 혹은 기본 객체를 JSON으로 변환하는 클래스 입니다.
    //         최상위 레벨의 객체는 무조건 NSArray나 NSDictionary여야 합니다. 우리가 어떤 걸 받았을 때, Array인지 Dictionary인지 알아야 한다는거잖아요. 불편한거예요.
    //         근데 iOS에서 제공하는 기본 클래스는 이걸 다 입력해주어야 해요. 또한 모든 객체는 NSString, NSNunber, NSDictionary, NSNull로 구성되어야 되요. 다르면 안되요.
    //         이런 것들이 제약조건이예요. 그래서 우리가 response를 다시 확인해보면, 최상위 객체가 뭡니까? 이게 JSON이잖아요. JSON에서 대괄호는 Array죠. */
    //
    //         if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
    //         /* JSON이 잘 들어왔는지 찍어보는 용도.
    //         debugPrint는 Print에 비해 훨씬 많은 정보를 줘요. 더 자세한 정보.
    //         Objective-C의 NSLog의 Swift 버전이 Print라고 보시면 됩니다. */
    //
    //         //                debugPrint(json)
    //
    //         /* 그럼 이제 이 안에서 email만 뽑아내 봅시다. */
    //         //                for object in json {
    //         //                    let pair = object as! Dictionary<String, Any>
    //         //                    let email = pair["email"] as! String
    //         //                    print(email)
    //         //                }
    //
    //         self.data = NSMutableArray(array: json)
    //
    //         DispatchQueue.main.async {
    //         self.tableView.reloadData()
    //         }
    //
    //
    //         }
    //
    //         }
    //
    //         task.resume()
    //
    //         */
    //    }
    //
    //    /* 이제 중급짜리 짧은 예제 해볼건데, 테이블뷰를 통해서 리프레시 하면 새로운 데이터 들어오고 뿌리고 이런거 해볼거예요. 제 희망은 간단한 SNS 하는게 희망인데 이게 될지 모르겠어요.
    //     일단 여러분은 오후에 로그인 하면서 멘붕에 빠질거예요. 여기까지는 아직 워밍업이다 생각하시면 됩니다.
    //     */
    //
    //
    /*이제 대충 UI를 만들어야 하니, Storyboard 가셔서 TableView를 하나 만드세요.*/
    @IBOutlet weak var tableView: UITableView!
    
    
    /* 그럼 이제 다음에 해야할 건 뭘까요? 데이터를 테이블로 뿌려주는게 남았죠. 어떻게 뿌려줄까요? DataSource와 Delegate를 연결시켜줘야겠죠. */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        let pair = data.object(at: indexPath.row) as! Dictionary<String, Any>
//        let email = pair["email"] as! String
//        let password = pair["password"] as! String
//        cell.textLabel?.text = email
//        cell.detailTextLabel?.text = password
//        
//        return cell
//    }
    
    /* 자 refresh를 넣었을 때 어떻게 해야할까요. 데이터를 불러와서 넣어주는 작업을 해야겠죠. 한번은 불러와야 하니까요. 일단 지금 불러온 것을 가지고 데이터 */
    @IBAction func refreshButtonAction(_ sender: UIButton) {
        
        fetchUserData()
        
    }
    
    
    //
    //    /* 프로그래머는 반복되는 코드를 혐오해야 합니다. 그래서 애초에 ViewDidLoad에 구현했던 걸 함수로 만들고 이 함수를 ViewDidLoad와 Refresh에 넣어서 써보겠습니다. */
    //    func fetchUserData() {
    //        let url = URL(string: "http://localhost:1337/user")
    //        var request = URLRequest(url: url!)
    //        request.httpMethod = "GET"
    //
    //        let task = URLSession.shared.dataTask(with: request) {
    //            data, response, error in
    //
    //            guard let data = data else { return } //이걸 쓰면 data 뒤에 ! 쓸필요 없죠.
    //
    //            let dataString = String.init(data: data, encoding: .utf8)
    //
    //            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
    //
    //                self.data = NSMutableArray(array: json)
    //
    //                //테이블뷰를 클릭해도 바로 되게 하는 것. 쓰레드 관련. UI에 구현되도록. 상단의 코드들은 메인쓰레드가 아니라 다른 쓰레드에서 실행되는 코드다. 따라서 이걸 메인으로 옮겨줘야 테이블뷰 UI에 반영되는 것이다.
    //                DispatchQueue.main.async {
    //                    self.tableView.reloadData()
    //                }
    //            }
    //        }
    //
    //        task.resume()
    //
    //    }
    //
    //
    //
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //
    //        fetchUserData()
    //    }
    //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//extension NSMutableData {
//    func appendString(_ str:String) {
//        self.append(str.data(using: .utf8)!)
//    }
//}
