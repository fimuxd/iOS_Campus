//
//  ViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

// TableView가 있는 Main ViewController

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /***********************************************************************/
    //          ViewController와 StoryBoard를 연결하는 IBOutlet 영역            //
    /***********************************************************************/
    @IBOutlet weak var tableView: UITableView!
    
    
    /***********************************************************************/
    //                  ViewController에서 쓸 전역변수 설정                      //
    /***********************************************************************/
    
    //    보영: 주석처리 이유 - 강사님이 아주아주 안 좋은 코드라고 해서 일단 간소화 했는데... 어떻게 이걸 안 쓸 수 있는진 모르겠어요..ㅠㅠ
    //    var memoList = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
    var memoList:[[String:String]] = []
    
    /***********************************************************************/
    //                         Life Cycle 영역                               //
    /***********************************************************************/
    override func viewWillAppear(_ animated: Bool) {
        //AddMemoViewController에서 가져온 UserDault 값 Reload
        
        memoList = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? [] // 보영: 이 것도 정말 안 좋은 코드 중 하나인데, 이걸 어떤 함수(if문)를 통해서 개선 할 수 있을 것 같아요. 근데 '어떻게' 할진 모르겠습니다...
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /***********************************************************************/
    //                      TableView 설정 영역                               //
    /***********************************************************************/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }

//    보영: 주석처리 이유 - 어차피 Section 갯수의 Default는 1이므로, Section 값이 1이라면 굳이 입력하지 않아도 됩니다.
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let memo:[String:String] = self.memoList[indexPath.row]
        let title:String = memo["title"]!
        //        보영: 주석처리 이유 - 흐름 상 쓰이지 않아 보였습니다.
        //        let content:String = memo["content"]!
        
        cell.textLabel?.text = title
        //        보영: 주석처리 이유 - 흐름 상 쓰이지 않아 보였습니다.
        //        cell.detailTextLabel?.text = content
        
        return cell
    }
    
    //    보영: 주석처리 이유 - prepare for segue를 모르겠어요 ㅠㅠ 그래서 아래와 같이 didSelecRow를 이용해서 navigation Push를 했습니다.
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let readAndedit: ReadAndEditViewController = segue.destination as! ReadAndEditViewController
    //
    //        let cell = sender as! UITableViewCell
    //
    //        readAndedit.texttitle = cell.textLabel?.text
    //        readAndedit.contents = cell.textLabel?.text
    //        
    //        
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController:ReadAndEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReadAndEditViewController") as! ReadAndEditViewController
        
        let memo:[String:String] = self.memoList[indexPath.row]
        let title:String = memo["title"]!
        let contents:String = memo["content"]!
        
        nextViewController.textTitle = title
        nextViewController.content = contents
        nextViewController.indexPath = indexPath.row
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
}

