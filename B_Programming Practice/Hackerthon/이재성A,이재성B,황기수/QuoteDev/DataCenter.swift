//
//  DataCenter.swift
//  QuoteDev
//
//  Created by leejaesung on 2017. 7. 6..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

let commentUserDefaultsForKey:String = "commentData"


// MARK: 명언 리스트 데이터 구조 - array 형태의 quote Dictionary를 갖는 array.
struct arrQuoteList {
    
    var _arrQuoteList:[quote] = []
    
    init(data aData:[String:Any]) {
        _arrQuoteList.append(quote(data: aData))
    }
    
    init(arrData aData:[[String:Any]]) {
        for item in aData {
            _arrQuoteList.append(quote(data: item))
        }
    }
    
    // index에 따라서 해당 dictionary 데이터를 리턴하는 메소드.
    func getDicOf(index anIndex:Int) -> quote {
        return _arrQuoteList[anIndex]
    }
    
    
}

// root 데이터를 Array로 바꾸면서 이하 주석 처리.
//struct dicQuoteList {
//    var _dicQuoteList:[String:quote] = [:] //Key값을 갖는 quote의 Dictionary 리스트
//    
//    init(quoteListData aData:[String:[String:Any]]) {
//        for item in aData {
//            _dicQuoteList.updateValue(quote(quoteData: item.value), forKey: item.key)
//        }
//    }
//}

struct quote {
    var content:String
    var speaker:String?
    var imgUrl:String?
    
    init(data aData:[String:Any]) {
        // plist로부터 값을 받아오는 용도
        content = aData["content"] as? String ?? "(no content)"
        speaker = aData["speaker"] as? String ?? "(no speaker)"
        imgUrl = aData["imgUrl"] as? String ?? "(no imgUrl)"
    }
    
    var dic:[String:Any] {
        var dicResult:[String:Any] = [:]
        dicResult.updateValue(content, forKey: "content")
        dicResult.updateValue(speaker ?? "(no content)", forKey: "speaker")
        dicResult.updateValue(imgUrl ?? "(no imgUrl)", forKey: "imgUrl")
        
        return dicResult
    }
    
}

// MARK: 댓글 리스트 데이터 구조 ( 버림 )
//struct commentList {
//    var _commentList:[String:comment] = [:]
//    
//    init(data aData:[String:[String:Any]]) {
//        for item in aData {
//            _commentList.updateValue(comment(data: item.value), forKey: item.key)
//        }
//    }
//    
//    // index에 따라서 해당 dictionary 데이터를 리턴하는 메소드.
//    func getDicOf(index anIndex:Int) -> comment {
//        return _commentList[String(anIndex)] ?? comment.init(data: ["nickName":"(no data)"])
//    }
//}

// MARK: 댓글 리스트 데이터 구조 ( 최종 )
// 1개의 명언에 여러개의 댓글이 가능. 새로운 구조로 시도중.....
struct commentTotalList {
    var _commentTotalList:[String:arrComment] = [:]
    
    init(data aData:[String:[[String:Any]]]) {
        for item in aData { //(comment(data: item.value), forKey: item.key)
            _commentTotalList.updateValue(arrComment(data: item.value), forKey: item.key)
        }
    }
    
    // index에 따라서 해당 array 데이터를 리턴하는 메소드.
    func getArrCommentOf(index anIndex:Int) -> arrComment {
        return _commentTotalList[String(anIndex)]!
    }
}

// 코멘트를 여러개 모은 array.
struct arrComment {
    var _arrComment:[comment] = []
    
    init(data aData:[[String:Any]]) {
        for item in aData {
            _arrComment.append(comment(data: item))
        }
    }
    
    // index에 따라서 해당 dictionary 데이터를 리턴하는 메소드.
    func getDicOf(index anIndex:Int) -> comment {
        return _arrComment[anIndex]
    }
    
    mutating func appendCommentDataOf(data aData:comment) {
        _arrComment.append(aData)
    }
    
    var arr:[[String:Any]] {
        var arrResult:[[String:Any]] = [[:]]
        for item in _arrComment {
            arrResult.append(item.dic)
        }
        return arrResult
    }
    
}

// MARK: 댓글 데이터 구조
struct comment {
    var nickName:String
    var comment:String
    var date:String
    
    init(data aData:[String:Any]) {
        nickName = aData["nickName"] as? String ?? "(no data)"
        comment = aData["comment"] as? String ?? "(no data)"
        date = aData["date"] as? String ?? "(no data)"
    }
    
    var dic:[String:Any] {
        var dicResult:[String:Any] = [:]
        dicResult.updateValue(nickName, forKey: "nickName")
        dicResult.updateValue(comment, forKey: "comment")
        dicResult.updateValue(date, forKey: "date")
        
        return dicResult
    }
}




// MARK: 데이터 센터 정의!!!
class DataCenter {
    
    static let sharedInstance = DataCenter()
    
    var rootData:arrQuoteList? // 명언 데이터
    var commentRootData:commentTotalList? // 새로운 댓글 데이터
    
    
    init() {
        loadData() // 명언 데이터 로드.
        loadCommentData() // 댓글 데이터 로드.
    }
    
    // plist로부터 document로 파일 복사 - 로직상 plist 파일을 수정하면, 앱을 지우고 다시 설치(빌드)합니다.
    func loadData() {
        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realDocuPath = docuPath[0] + "/QuoteList.plist"
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: realDocuPath) {
            if let bundlePath = Bundle.main.path(forResource: "QuoteList", ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realDocuPath)
                } catch  {
                    return
                }
            } else {
                // 번들에도 파일이 없으면, 역시 리턴..
                return
            }
        }
//        let dicData = NSDictionary(contentsOfFile: realDocuPath) as? [String : Any]
        let nsArrData = NSArray(contentsOfFile: realDocuPath) as! [[String : Any]]
        
        rootData = arrQuoteList(arrData: nsArrData)
    }
    
    // MARK: index에 따라서 명언 이미지 파일명을 리턴하는 메소드.
    func getQuoteImageFileNameOf(index anIndex:Int) -> String {
        let img = rootData?.getDicOf(index: anIndex).imgUrl
        
        return img!
    }
    
    // MARK: index에 따라서 명언 내용을 리턴하는 메소드.
    func getQuoteContentOf(index anIndex:Int) -> String {
        let quoteContent = rootData?.getDicOf(index: anIndex).content
        
        return quoteContent!
    }
    
    // MARK: index에 따라서 명언 스피커를 리턴하는 메소드.
    func getQuoteSpeakerOf(index anIndex:Int) -> String {
        let quoteSpeaker = rootData?.getDicOf(index: anIndex).speaker
        
        return quoteSpeaker!
    }
    
    
    
    // ***** ***** ***** ***** ***** 댓글 데이터센터 ***** ***** ***** ***** ***** //
    
    
    
    func loadCommentData() {
        guard let dicData = UserDefaults.standard.dictionary(forKey: commentUserDefaultsForKey) else {
            print("ERROR- loadData_guard_let")
            self.commentRootData = commentTotalList(data: ["0" : [["nickName" : "재성A", "comment" : "0-0 댓글입니다.", "date" : "07/07"], ["nickName" : "기수", "comment" : "0-1 댓글입니다.", "date" : "07/08"]],
                                                           
                "1" : [["nickName" : "보영", "comment" : "정말 좋은 명언이예요! 1-1", "date" : "07/07"],
                       ["nickName" : "창호", "comment" : "개발 공부를 열심히 하겠어요! 1-2", "date" : "07/08"]],
                "2" : [["nickName" : "동윤", "comment" : "iOS 마스터!! 2-1", "date" : "07/07"],
                       ["nickName" : "은영", "comment" : "개발자 모두 화이팅! 2-2", "date" : "07/08"]],
                "3" : [["nickName" : "기수", "comment" : "좋은 명언이예요! 3-1", "date" : "07/07"],
                       ["nickName" : "하늘", "comment" : "열심히 하겠습니다. 3-2", "date" : "07/08"]],
                "4" : [["nickName" : "형수", "comment" : "정말 좋은 명언이예요! 4-1", "date" : "07/07"],
                       ["nickName" : "현종", "comment" : "열심히 하겠습니다. 4-2", "date" : "07/08"]],
                "5" : [["nickName" : "현정", "comment" : "개발자 모두 화이팅! 5-1", "date" : "07/07"],
                       ["nickName" : "종훈", "comment" : "개발자 모두 화이팅! 5-2", "date" : "07/08"]],
                "6" : [["nickName" : "교윤", "comment" : "개발자 모두 화이팅! 6-1", "date" : "07/07"],
                       ["nickName" : "새결", "comment" : "정말 좋은 명언이예요! 6-2", "date" : "07/08"]],
                "7" : [["nickName" : "성찬", "comment" : "iOS 마스터!! 7-1", "date" : "07/07"],
                       ["nickName" : "선미", "comment" : "더 열심히 공부하려구요! 7-2", "date" : "07/08"]],
                "8" : [["nickName" : "태형", "comment" : "iOS 마스터!! 8-1", "date" : "07/07"],
                       ["nickName" : "종찬", "comment" : "정말 좋은 명언이예요! 8-2", "date" : "07/08"]],
                "9" : [["nickName" : "찬욱", "comment" : "iOS 마스터!! 9-1", "date" : "07/07"],
                       ["nickName" : "재성B", "comment" : "정말 좋은 명언이예요! 9-2", "date" : "07/08"]]
                ])
//            UserDefaults.standard.set(commentRootData, forKey: commentUserDefaultsForKey)

            return
        }

        self.commentRootData = commentTotalList(data: dicData as! [String : [[String : Any]]])
    }
    
//    func saveCommentDataOf(comment aComment: comment, index anIndex: Int) {
//        let strIndex = String(anIndex)
//        
//        guard var dicData = UserDefaults.standard.dictionary(forKey: commentUserDefaultsForKey) else {
//            UserDefaults.standard.set([strIndex: aComment.dic], forKey: commentUserDefaultsForKey)
//            loadCommentData() // Save the singleton too.
//            print("ERROR- saveDataOf_guard_let")
//            return
//        }
//        dicData[strIndex] = aComment.dic
//        
//        UserDefaults.standard.set(dicData, forKey: commentUserDefaultsForKey)
//        loadCommentData() // Save the singleton too.
//        
//        print("Success- UserDefaults_set")
//    }
    
    
    // MARK: 데이터모델링으로 댓글을 저장하려고 했으나, 잠정 실패..
    func saveCommentDataOf(comment aComment: comment, index anIndex: Int) {
        let strIndex = String(anIndex)
        let temp1 = aComment.dic
        let temp2 = arrComment(data: [temp1])
        let temp3 = commentTotalList(data: [strIndex : temp2.arr])

        guard var dicData = UserDefaults.standard.dictionary(forKey: commentUserDefaultsForKey) else {
            UserDefaults.standard.set(temp3, forKey: commentUserDefaultsForKey)
            loadCommentData() // Save the singleton too.
            print("ERROR- saveDataOf_guard_let")
            return
        }
        
        let tempData1 = dicData[strIndex] as! [[String:Any]] //arrComment
//        tempData.updateValue(temp2, forKey: strIndex)
        var tempData2 = arrComment(data: tempData1)
        tempData2.appendCommentDataOf(data: aComment)
        
        
//        temp2 = arrComment(data: [tempData1])
        
        dicData.updateValue(tempData2, forKey: strIndex)
//
//        var tempData = arrComment(data: dicData[strIndex] as! [[String : Any]])
//        tempData._arrComment.append(aComment)
        
        UserDefaults.standard.set(dicData, forKey: commentUserDefaultsForKey)
        
        loadCommentData()
    }
    
    
    // 임시로 싱글톤에만 저장하는 코드로...
    func saveCommentDataTemp(comment aComment: comment, index anIndex:Int) {
        self.commentRootData?._commentTotalList[String(anIndex)] = arrComment(data: [aComment.dic])
    }
    
    
    // 인덱스에 따른 arrComment 리턴하는 액션.
    // 사용법: tempData.getDicOf(index: 0).nickName
    func getCommentDataOf(index anIndex:Int) -> arrComment {
        return commentRootData!.getArrCommentOf(index: anIndex)
    }
    
}

/*
 
 ["0" :
    [
        ["nickName" : "재성A", "comment" : "첫번째 댓글입니다.", "date" : "07/07"],
        ["nickName" : "기수", "comment" : "두번째 댓글입니다.", "date" : "07/08"]
    ]
 ]
 
 */
