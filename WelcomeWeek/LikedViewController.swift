//
//  LikedViewController.swift
//  WelcomeWeek
//
//  Created by Merlin Zhao on 1/28/18.
//  Copyright © 2018 Merlin Zhao. All rights reserved.
//

import UIKit

//used for selecting liked things from history
var myIndexSelect = 0

class LikedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    //MUST HAVE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedArrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = likedArrayNames[indexPath.row]
       
        return cell!
    }
    //---------------
    
    //select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selected code
        myIndexSelect = indexPath.row
        print(myIndexSelect)
        print(likedArrayNames)
        performSegue(withIdentifier: "toHistory", sender: self)
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        myTableView.delegate = self
        myTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
