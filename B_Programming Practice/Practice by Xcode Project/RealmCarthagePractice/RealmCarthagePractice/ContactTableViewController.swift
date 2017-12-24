//
//  ContactTableViewController.swift
//  RealmCarthagePractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit
import RealmSwift

class ContactTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let contactArray = realm.objects(Contact.self)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        
        cell.displayingItem = contactArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeFromRealm(contactArray[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailSegue", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let senderCell: ContactCell = sender as! ContactCell
            let detailViewController: DetailViewController = segue.destination as! DetailViewController
            
            detailViewController.displayingItemIndex = senderCell.displayingItem.personID
        }
    }
}

class ContactCell: UITableViewCell {
    static let reuseIdentifier: String = "ContactCell"
    var displayingItem: Contact! {
        didSet {
            self.textLabel?.text = displayingItem.name
            self.detailTextLabel?.text = displayingItem.phoneNumeber
        }
    }
    
}
