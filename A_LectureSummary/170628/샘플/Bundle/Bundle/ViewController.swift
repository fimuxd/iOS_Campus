//
//  ViewController.swift
//  Bundle
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  var names = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 번들 폴더
    //    let bundlePath = Bundle.main.bundlePath
    //    print("bundle Path :", bundlePath)
    
    // 홈 경로
    //    let homePath = NSHomeDirectory()
    //    print("home Path :", homePath)
    
    // 홈 경로에서 도큐먼트 폴더 경로 얻기
    //    let documentPath2 = NSHomeDirectory() + "/Documents"
    //    print("document path2 :", documentPath2)
    
    // 번들 내 리소스 경로
    let path = Bundle.main.path(forResource: "idols", ofType: "plist")!
    Bundle.main.path(forResource: "idols", ofType: "plist") 
    print("resource path :", path)
    
    guard let content = NSArray(contentsOfFile: path) as? Array<String> else { return }
    names = content
    
    // 번들 폴더에서 도큐먼트 폴더로 복사
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let destPath = documentPath + "/copied.plist"
    print("document path :", documentPath)
    
    let fm = FileManager.default
    if !fm.fileExists(atPath: destPath) {
      do {
        try fm.copyItem(atPath: path, toPath: destPath)
        print("도큐먼트 폴더에 파일 복사 완료")
      } catch let error {
        print("파일 복사 에러 :", error.localizedDescription)
      }
    } else {
      print("도큐먼트 폴더에 파일 있음. 복사 안함")
    }
    
    // 도큐먼트 폴더 내 파일 목록 출력
    if let files = try? fm.contentsOfDirectory(atPath: documentPath) {
      print("\(files.count) Files in Documents : \(files)")
    }
    
    guard let data = NSArray(contentsOfFile: destPath) else { return }
    if !data.contains("마마무") {
      // 복사한 파일에 추가 데이터 삽입
      let newData = data.adding("마마무")
      (newData as NSArray).write(toFile: destPath, atomically: true)
    }
    
    // 바뀐 데이터를 다시 파일에 입력
    guard let newContent = NSArray(contentsOfFile: destPath) as? Array<String> else { return }
    print(newContent)
    names = newContent
  }
}


extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "idolCell", for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    return cell
  }
}
