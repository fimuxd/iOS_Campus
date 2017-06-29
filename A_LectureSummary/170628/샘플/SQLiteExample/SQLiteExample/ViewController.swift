//
//  ViewController.swift
//  SQLiteExample
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import UIKit

//1. open - sqlite3_open            // 연결 생성,  open_v2 : 주로 쓰레드 처리 관련
//2. prepare - sqlite3_prepare_v2   // 파싱
//3-1. step - sqlite3_step          // 쿼리 실행 및 fetch row
//3-2. column - sqlite3_column_~~~  // sql
//4. finalize - sqlite3_finalize    // 질의 완료. 커밋 후 stmt 해제.
//5. close - sqlite3_close          // DB 연결 종료   close: 종료 시도, close_v2 : 강제 종료

//exec - sqlite3_prepare -> sqlite3_step -> sqlite3_finalize  래핑 함수. 단일 건에만 사용할 것

class ViewController: UIViewController {
  lazy var db: OpaquePointer? = {
    var db: OpaquePointer?
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                      .userDomainMask,
                                                      true)[0]
    let filePath = dirPath + "/database.sqlite"
    let result = sqlite3_open(filePath, &db)
    
    guard result == SQLITE_OK else { return nil }
    return db
  }()
  
  var stmt: OpaquePointer?
  
  lazy var dateFormatter : DateFormatter = {
    let dateFormmater = DateFormatter()
    dateFormmater.dateStyle = .short
    return dateFormmater
  }()
  
  enum SQLError: Error {
    case connectionError
    case queryError
    case UnknownError
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    print(SQLInterfa)
    createTable()
    //        addTodo(title: "Todo1", dueDate: Date())
    //        addTodo(title: "Todo2", dueDate: Date())
    //        addTodo(title: "할일3", dueDate: Date())
    //    fetchData()
  }
  
  deinit {
    guard let db = db else { return }
    sqlite3_close_v2(db)
  }
}


//MARK: Data Handler
extension ViewController {
  func createTable() {
    let sql = "CREATE TABLE IF NOT EXISTS todo ( TITLE text, DUEDATE date )))))"
    var error : UnsafeMutablePointer<Int8>?
    
    guard sqlite3_exec(db, sql, nil, nil, &error) == SQLITE_OK else {
      print("테이블 생성 실패")
      return
    }
    print("테이블 생성 성공")
  }
  
  func addTodo(title : String, dueDate : Date) {
    let sql = "INSERT INTO todo (title, duedate) VALUES (?, ?)"
    var stmt : OpaquePointer? = nil
    
    if SQLITE_OK == sqlite3_prepare_v2(db, sql, -1, &stmt, nil) {
      let titleStr = title.cString(using: .utf8)
      sqlite3_bind_text(stmt, 1, titleStr, -1, nil)
      
      let dateStr = dateFormatter.string(from: dueDate)
      sqlite3_bind_text(stmt, 2, dateStr, -1, nil)
      
      if SQLITE_DONE == sqlite3_step(stmt) {
        print("할일 추가 성공")
      } else {
        print("할일 추가 실패")
      }
      
      sqlite3_finalize(stmt)
    }
  }
  
  func fetchData() {
    let sql = "SELECT title, dueDate FROM todo"
    var stmt : OpaquePointer?
    
    if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
      while SQLITE_ROW == sqlite3_step(stmt) {
        let column1 = sqlite3_column_text(stmt, 0)!
        let title = String(cString: column1)
        
        let column2 = sqlite3_column_text(stmt, 1)!
        let dateStr = String(cString: column2)
        let dueDate = dateFormatter.date(from: dateStr)
        
        print("할일 : \(title) - dueDate : \(dueDate)")
      }
    }
    else {
      print("prepare failure")
    }
  }
}
