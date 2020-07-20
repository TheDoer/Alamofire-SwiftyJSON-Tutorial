//
//  ViewController.swift
//  ALamorefiire-SwiftyJSON-SkeletonView
//
//  Created by Adonis Rumbwere on 16/7/2020.
//  Copyright © 2020 Onyx Studio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContactsViewController: UIViewController {
    
    var contacts = [Contacts]()
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        
        self.ContactsAPICalling {
            print("Contacts Downloaded")
            self.contactsTableView.reloadData()
        }
    }
    
    func ContactsAPICalling(completed: @escaping DownloadComplete){
        
        Alamofire.request(API_CONTACTS, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { (contactsResponse) in
            
            let result = contactsResponse.result
            let contactsJSON = JSON(result.value!)["contacts"]
            
            print(contactsJSON)
            
            for i in 0..<contactsJSON.count {
                
                let allContacts = Contacts(contactDict: contactsJSON[i])
                
                self.contacts.append(allContacts)
            }
            
            completed()
       
        }
        
    }
    

}


extension ContactsViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return contacts.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactscell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "contactscell")
        }
        
        cell?.textLabel?.text = contacts[indexPath.row].name
        cell?.detailTextLabel?.text = contacts[indexPath.row].email
        
        return cell!
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toContactsView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? ContactDetailsViewController {
            destinationVC.contactDetails = contacts[(contactsTableView.indexPathForSelectedRow?.row)!]
            contactsTableView.deselectRow(at: contactsTableView.indexPathForSelectedRow!, animated: true)
            
        }
    }
    
    
 
}

