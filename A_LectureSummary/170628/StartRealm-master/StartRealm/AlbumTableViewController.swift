//
//  AlbumTableViewController.swift
//  StartRealm
//
//  Created by Mijeong Jeon on 20/03/2017.
//  Copyright © 2017 Jo Seong Gyu. All rights reserved.
//

import UIKit
// 0. import RealmSwift

class AlbumTableViewController: UITableViewController, UISearchBarDelegate {
    
    // 1. realm, album properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Realm() init

        // 3. Album Result & Sort
        
        // 10. Realm Notigication - tableView reload

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 4. TableView Cell Count = 앨범 수
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumTableViewCell
       
        // 5. Cell text = 앨범 타이틀

        // 6. Cell thumnail = 앨범에 속한 최신 사진

    
        return cell
    }
    
    // 앨범명 입력받는 alert
    @IBAction func addNewAlbum(_ sender: UIBarButtonItem) {
        // 7. Realm Write - 앨범명 입력
        alertForAlbumName(albumName: nil)
    }
    
    func alertForAlbumName(albumName: Album?) {

    }

    // 셀 슬라이드시 수정, 삭제
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        return []
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 9. Realm Filter = 앨범명 검색
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
