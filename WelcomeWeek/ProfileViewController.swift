//
//  ProfileViewController.swift
//  WelcomeWeek
//
//  Created by Merlin Zhao on 1/27/18.
//  Copyright © 2018 Merlin Zhao. All rights reserved.
//

import UIKit

var athleticSet = 0
var artSet = 0
var campusSet = 0
var careerSet = 0


var urlNameArray = ["Hello"]
var urlLocationArray = ["Hello"]

class ProfileViewController: UIViewController {
   
  
     //DONE BUTTON
    @IBAction func doneButton(_ sender: Any) {
        
 
        i = 0
        var athleticsvalue = athleticSet
        var univalue = campusSet
        var careervalue = careerSet
        var entertainment = artSet
        
        
        guard let url = URL(string: "https://matthewchan.lib.id/delta@dev/?athletics="+String(athleticsvalue)+"&uni="+String(univalue)+"&career="+String(careervalue)+"&entertainment="+String(entertainment)) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                //-------------------------------
                //arrays
                var names = [String]()
                var descriptions = [String]()
                var athletics = [Int]()
                var unis = [Int]()
                var careers = [Int]()
                var entertainments = [Int]()
                var locations = [String]()
                var ids = [Int]()
                var urlnames1 = [String]()
                var urllocations = [String]()
                //-------------------------------
                
                do {
                    let data = try Data(contentsOf: url)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) //as? [[String: Any]]{
                    guard let array = json as? [Any] else { return }
                    for elements in array{
                        guard let userDict = elements as? [String: Any] else { return }
                        //===============================================
                        //goes through all the elements in the json array
                        //appends into appropriate arrays (e.g. names, description)
                        if let name = userDict["name"] as? String{
                            names.append(name)
                        }
                        if let description = userDict["description"] as? String{
                            descriptions.append(description)
                        }
                        if let athletic = userDict["athletics"] as? Int{
                            athletics.append(athletic)
                        }
                        if let uni = userDict["uni"] as? Int{
                            unis.append(uni)
                        }
                        if let career = userDict["career"] as? Int{
                            careers.append(career)
                        }
                        if let entertainment = userDict["entertainment"] as? Int{
                            entertainments.append(entertainment)
                        }
                        if let location = userDict["location"] as? String{
                            locations.append(location)
                        }
                        if let id = userDict["id"] as? Int{
                            ids.append(id)
                        }
                        if let urlname = userDict["urlname"] as? String{
                            urlnames1.append(urlname)
                        }
                        if let urllocation = userDict["urllocation"] as? String{
                            urllocations.append(urllocation)
                        }
                        //===============================================
                    }
                    print(json) //prints actualy json without parse
                    
                   
                    print(locations)
                    print(ids)
                    print("URL stuff")
                    print(urlnames1)
                    print(urllocations)
                    

                    eventName = names
                    eventName.append("end")
                    details = descriptions
                    details.append("end")
                    locationsTimes = locations
                    locationsTimes.append("end")
                    eventIds = ids
                    eventIds.append(0)
                    
                    urlLocationArray = urllocations
                    urlNameArray = urlnames1
                    
                   
                    
                } catch {
                    print(error)
                }
                
                
            }
            }.resume()

        
        
        
        
        //give time to laod
        sleep(2)
        
        
    
        dismiss(animated: true, completion: nil)
    }
    
    //---------------------------------
    
    //HEADER LABELS
    @IBOutlet weak var athleticLabel: UILabel!
    @IBOutlet weak var artLabel: UILabel!
    @IBOutlet weak var campusLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    
    //SLIDER OUTLET
    @IBOutlet weak var athleticSliderOutlet: UISlider!
    @IBOutlet weak var artSliderOutlet: UISlider!
    @IBOutlet weak var campusSliderOutlet: UISlider!
    @IBOutlet weak var careerSliderOutlet: UISlider!
    
    //SLIDERS
    @IBAction func athleticSlider(_ sender: UISlider) {
        
        athleticLabel.text = "Athletic Activities " + String(Int(sender.value))
        athleticSet = Int(sender.value)
        
    }
    @IBAction func artSlider(_ sender: UISlider) {
        artLabel.text = "Arts and Entertainment " + String(Int(sender.value))
        artSet = Int(sender.value)
    }
    @IBAction func campusSlider(_ sender: UISlider) {
        campusLabel.text = "Campus Life " + String(Int(sender.value))
        campusSet = Int(sender.value)
    }
    @IBAction func careerSlider(_ sender: UISlider) {
        careerLabel.text = "Career Exploration " + String(Int(sender.value))
        careerSet = Int(sender.value)
    }
    

    
    
    
    
    override func viewDidLoad() {
        athleticSliderOutlet.setValue(Float(athleticSet), animated: true)
        artSliderOutlet.setValue(Float(artSet), animated: true)
        campusSliderOutlet.setValue(Float(campusSet), animated: true)
        careerSliderOutlet.setValue(Float(careerSet), animated: true)


        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
