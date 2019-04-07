//
//  MyStuff.swift
//  
//
//  Created by AISD on 4/7/19.
//

import UIKit

class MyStuff: UIViewController, UITableViewDataSource,UITableViewDelegate {
   
    
    @IBOutlet weak var StuffTable: UITableView!
    var MeS = [String]()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Hmm", sender: self)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MeS.append("Bill Gates Scholarship")
        //MeS.append("Coca Cola Scholarship")
        MeS.append("Denny’s Hungry for Education Foundation")

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MeS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let se = tableView.dequeueReusableCell(withIdentifier: "Seus")! as UITableViewCell
        
        
        
        se.textLabel?.text = MeS[indexPath.row]
        //StuffTable.reloadData()
        
        
        return se
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
