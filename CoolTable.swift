//
//  CoolTable.swift
//  
//
//  Created by AISD on 4/2/19.
//

import UIKit
import Firebase
import GoogleSignIn
var refa: DatabaseReference!

class CoolTable: UITableViewController{
    var posts = [eventStruct]()
    
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        refa = Database.database().reference()
        loadNews()
        tableview.delegate = self
        tableview.dataSource = self
        
        
    }
    struct eventStruct {
        let name: String!
        let date: String!
    }
    
    func loadNews() {
        refa.child("Club").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            
            if let valueDictionary = snapshot.value as? [AnyHashable:String]
            {
                let name = valueDictionary["Name"]
                let date = valueDictionary["date"]
                self.posts.insert(eventStruct(name: name, date: date), at: 0)
                self.tableview.reloadData()
                
                
            }
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].name
        
        
        
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = posts[indexPath.row].date
        
        return cell
    }

    
}
