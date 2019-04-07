//
//  ViewController.swift
//  TSAApp
//
//  Created by AISD on 2/20/19.
//  Copyright © 2019 AISD. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import TagListView

var ref: DatabaseReference!

class ViewController: UIViewController, TagListViewDelegate, GIDSignInUIDelegate, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var Afr: UIButton!
   
    
    //@IBOutlet weak var Tasty: UILabel!
    
    
    
    
    @IBOutlet weak var newTag: TagListView!
    
    @IBOutlet var incomeLevels: [UIButton]!
    
    @IBOutlet var Races2: [UIButton]!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var Description: UITextView!
    
    
    
    @IBOutlet weak var Afrs: UIButton!
    @IBOutlet weak var RoundedButton1: UIButton!

    var myIndex = 0

var array = [String]()
    var  Titles = ["Sons of Italy"]
    var Descr = ["U.S. citizens of Italian descent (at least one Italian or Italian-American grandparent) enrolled in a four  year undergraduate program or a graduate program at an accredited academic institution for the Fall 2019 term. Previous SIF scholarship winners are not eligible. Additional eligibility requirements may apply to specific scholarships",
                 "The Gates Scholarship is a highly selective, full scholarship for exceptional, Pell-eligible, minority, high school seniors. Starting in 2018, the scholarship will be awarded to 300 top student leaders each year with the intent of promoting their academic excellence through college graduation, and providing them the opportunity to reach their full potential.",  "The Coca-Cola Scholars Program scholarship is an achievement-based scholarship awarded to graduating high school seniors. Students are recognized for their capacity to lead and serve, as well as their commitment to making a significant impact on their schools and communities. With the 30th class in 2018, the Foundation has provided over 6,000 Coca-Cola Scholars with more than $66 million in educational support. 150 Coca-Cola Scholars are selected each year to receive this $20,000 scholarship. The 2019 Coca-Cola Scholars Program scholarship application is now closed and status notifications have been sent to all applicants. Links to other scholarship opportunities can be found in the Resources section below."
  ]
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MyScholarships", sender: self)

        myIndex = indexPath.row

    }
    override func viewDidLoad() {
        //GetUser()
      //RoundedButton1.layer.masksToBounds = true
        
        

        
        super.viewDidLoad()

        array.append("Sons Of Italy")
        array.append("Bill Gates Scholarship")
        array.append("CocaCola Scholarship")
        array.append("Denny’s Hungry for Education Foundation")
        array.append("Dell Scholars Program Scholarship")
        array.append("GE-Reagan Foundation Scholarship Program")
        array.append("David Pohl Scholarship")
        array.append("Anne Trabue Scholarship Fund")
        array.append("A Little Hope Foundation Dr.Emma Lerew")
        array.append("1000 Dreams Scholarship Fund")
        array.append("Bodie McDowell Scholarship")
        if(myIndex == 0){
        Description?.text = Descr[0]
        myIndex += 1
        }
        if(myIndex == 1){
            
            Description?.text = Descr[1]
            
        }
        //RoundedButton1.layer.cornerRadius = 10.0

        ref = Database.database().reference()
            //GetUser()
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
        
        //Afrs.backgroundColor = UIColor.blue

        

        //Tasty?.text = Titles[myIndex]

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
   
 
    @IBAction func under20(_ sender: UIButton) {
        array.removeAll{$0 == "Denny’s Hungry for Education Foundation"}

        reload()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        
        
        cell.textLabel?.text = array[indexPath.row]
        
        
        
        return cell
        
        
    }
    
    @IBAction func handleSelectorRaces(_ sender: UIButton) {
    }
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
    }
    func reload(){
        
        tableView.reloadData()
    }
    enum Levels: String{
        
        case Less20 = "Less than 20,000"
        case Twenty_Fifty = "20-50,000"
        case Fifty_Seventy = "50-70,000"
        case Seventy_Plus = "70,000 Plus"
    

    }
    
    
    
 
  
     @IBAction func HandleSelec(_ sender: UIButton) {
        incomeLevels.forEach { (button) in
            UIView.animate(withDuration: 0.1, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    
    }
    
    
    @IBAction func LevelTapped(_ sender: UIButton) {
    
        guard let title = sender.currentTitle, let income = Levels(rawValue: title) else {
            return
            
        }
     
        switch income {
        case .Less20:
            array.removeAll{ $0 == "David Pohl Scholarship"}
            tableView.reloadData()
        case .Fifty_Seventy:
            print("Fifty70")
        case .Seventy_Plus:
            print("70+")
        
        default:
            print("hey")
        }
    
    }

    @IBAction func White(_ sender: UIButton) {
        array.removeAll{ $0 == "David Pohl Scholarship"}
        array.removeAll{ $0 == "Sons Of Italy"}
    
    
    }
    
    @IBAction func Link(_ sender: UIButton) {
        if let url = URL(string: "https://www.thegatesscholarship.org/scholarship") {
            UIApplication.shared.open(url, options: [:])
        }
    
    }
    @IBAction func ForMenTag(_ sender: Any) {
        array.removeAll{ $0 == "Bodie McDowell Scholarship" }
    
        array.removeAll{ $0 == "1000 Dreams Scholarship Fund" }
        tableView.reloadData()

    }
    
    
@IBAction func English(_ sender: UIButton) {
    //array.removeAll {$0 == "A Little Hope Foundation Dr.Emma Lerew"}
        //tableView.reloadData()
        
    }
    
    
    @IBAction func BlackPressed(_ sender: UIButton) {
        array.removeAll{ $0 == "David Pohl Scholarship"}
        array.removeAll{ $0 == "A Little Hope Foundation Dr.Emma Lerew"}

        tableView.reloadData()
    }
    
    
    @IBAction func AsianTagPressed(_ sender: UIButton) {

    
    
    }
    
    
    
    
    /**
    func GetUser(){
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value
            , with: {(DataSnapshot) in
                print(DataSnapshot)
        })
        
        
    }
    **/
    
    
    @IBAction func SaveScholarship(_ sender: UIButton) {
        
        
        
        
        
    }
    
        
    }
extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}


