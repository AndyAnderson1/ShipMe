//
//  ThStuffTableView.swift
//  TSAApp
//
//  Created by AISD on 4/2/19.
//  Copyright © 2019 AISD. All rights reserved.
//

import UIKit

class ThStuffTableView: UITableViewController {

    var ref:DatabaseReference!,
    posts = [eventStruct]()
    
    @IBOutlet weak var tableview: UITableView!
    
    struct eventStruct {
        let title: String!
        let date: String!
        let location: String!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadNews() {
        ref = Database.database().reference()
        ref.child("events").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
            
            if let valueDictionary = snapshot.value as? [AnyHashable:String]
            {
                let title = valueDictionary["Title"]
                let location = valueDictionary["Location"]
                let date = valueDictionary["Date"]
                self.posts.insert(eventStruct(title: title, date: date, location: location), at: 0)
            }
        })
        self.tableview.reloadData()
    }
    
    //Table View Content
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].title
        
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = posts[indexPath.row].location
        
        let label3 = cell.viewWithTag(3) as! UILabel
        label3.text = posts[indexPath.row].date
        
        return cell
    }
    
}
