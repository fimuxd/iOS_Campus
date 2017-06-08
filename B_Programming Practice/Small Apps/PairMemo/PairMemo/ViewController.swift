//
//  ViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
 ////////////////////////////////////////////////////////////
    
    override func viewWillAppear(_ animated: Bool) {
        //AddMemoViewController에서 가져온 UserDault 값 Reload
        
        memoList = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        tableView.reloadData()
    }
    
    //ViewController에서 쓸 array 변수 설정
    var memoList = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/////////////////////////////////////////////////////////////
  

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController:ReadAndEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReadAndEditViewController") as! ReadAndEditViewController
        
        let memo:[String:String] = self.memoList[indexPath.row]
        let title:String = memo["title"]!
        let contents:String = memo["contant"]!
        
        nextViewController.texttitle = title
        nextViewController.contents = contents
        nextViewController.indexpath = indexPath.row
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
//    보영: prepare for segue를 모르겠어요 ㅠㅠ
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
    
    
    //테이블뷰 만든거 코드에요
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let memo:[String:String] = self.memoList[indexPath.row]
        let title:String = memo["title"]!
//        let content:String = memo["content"]!
        
        cell.textLabel?.text = title
//        cell.detailTextLabel?.text = content
        
        return cell
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /////////////////////////////////////////////////
    
}

