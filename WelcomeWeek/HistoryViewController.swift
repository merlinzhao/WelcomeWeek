//
//  HistoryViewController.swift
//  WelcomeWeek
//
//  Created by Merlin Zhao on 1/28/18.
//  Copyright © 2018 Merlin Zhao. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyEventName: UILabel!
    @IBOutlet weak var historyLocation: UILabel!
    @IBOutlet weak var historyDetails: UILabel!
    
    
    @IBOutlet weak var historyImage: UIImageView!
    
    
    
    
    //Back button
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        historyEventName.text = likedArrayNames[myIndexSelect]
        historyDetails.text = likedArrayDescription[myIndexSelect]
        historyLocation.text = likedArrayLocation[myIndexSelect]
        
        historyImage.image = UIImage(named: String(likedArrrayIds[myIndexSelect])+".jpg")
        historyImage.layer.cornerRadius = 10
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
