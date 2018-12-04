//
//  ViewController.swift
//  WelcomeWeek
//
//  Created by Merlin Zhao on 1/27/18.
//  Copyright © 2018 Merlin Zhao. All rights reserved.
//

import UIKit
var i = 0
var details = ["Welcome to the Marauder Welcome Week App! To get started, set up your preferences and start finding events. Swipe right to like an event, and left to dismiss it. ","end"]
var eventName = ["HELLO!","end"]
var locationsTimes = ["Start here","end"]
var eventIds = [-1,0]

//array to keep track of all the likes
var likedArrayNames = [String]()
var likedArrayDescription = [String]()
var likedArrayLocation = [String]()
var likedArrrayIds = [Int]()

class ViewController: UIViewController {
    
    
    
    var divisor: CGFloat! //for roatiton cards
    
    //LIKE BUTTON
    @IBOutlet weak var likeButtonLabel: UIButton!
    @IBAction func likeButton(_ sender: Any) {
        print("LIKE")
        viewDidAppear(true)
    }
    
    //DISLIKE BUTTON
    @IBOutlet weak var dislikeButtonLabel: UIButton!
    @IBAction func dislikeButton(_ sender: Any) {
        print("DISLIKE")
    }
    
    //PROFILE BUTTON
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    //EVENT IMAGE
    @IBOutlet weak var eventImage: UIImageView!
    
    
    
    
    //CARD
    
    @IBOutlet weak var card: UIView!
    

    func resetCard(){
        self.xImageView.alpha = 0
        viewDidAppear(true)
        UIView.animate(withDuration: 0.05, animations: {
            self.card.center = self.view.center
            self.card.alpha = 1
            
            self.card.transform = CGAffineTransform.identity
        })
    
    }
    

    //PANNING THE CARD
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
       
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        
        if card.center.x > view.center.x{
            xImageView.image = #imageLiteral(resourceName: "Unknown")
            xImageView.tintColor = UIColor.green
     
            
        }else {
            xImageView.image = #imageLiteral(resourceName: "tinder-nope")
            xImageView.tintColor = UIColor.red
          
        }
        
        xImageView.alpha = abs(xFromCenter) / view.center.x
        
    
        if sender.state == UIGestureRecognizerState.ended{
            
            //move off to left side
            if card.center.x < 50 {
                UIView.animate(withDuration: 0.4, delay: 0.1, animations: {
                    card.center = CGPoint(x: card.center.x - 250, y: card.center.y - 125)
                    card.alpha = 0
                },completion: {(finished:Bool) in
                    self.resetCard()
                })
                if eventName[i] != "end"{
                    i += 1
                }
                //REMOVE FROM ARRAY...
                //..
                //..
                //..
                return
                
             
            }
            //move off to right side (LIKE)
            else if card.center.x > (view.frame.width - 50){
                UIView.animate(withDuration: 0.4, delay: 0.1, animations: {
                    card.center = CGPoint(x: card.center.x + 250, y: card.center.y - 125)
                    card.alpha = 0
                },completion: {(finished:Bool) in
                    self.resetCard()
                    
                })
                //add to history list
                if eventName[i] != "end"{
                    likedArrayNames.append(eventName[i])
                    likedArrayDescription.append(details[i])
                    likedArrayLocation.append(locationsTimes[i])
                    likedArrrayIds.append(eventIds[i])
                    i += 1
                    
                    print(likedArrayNames)
                }
                
                //SEND TEXT STUFF.............
                //var textmessage =
                //print(textmessage)
                var phonenumber = 6479936121
                
                guard let url2 = URL(string: "https://matthewchan.lib.id/delta@dev/send/?text=This%20is%20a%20reminder%20that%20you%20have%20"+urlNameArray[i-1]+"%20at%20"+urlLocationArray[i-1]+"&number="+String(phonenumber)) else { return }
                let session2 = URLSession.shared
                
                session2.dataTask(with: url2) { (data2, response2, error2) in
                    if let response2 = response2 {
                        print(response2)
                    }
                    if let data2 = data2 {
                        print(data2)
                        do {
                            let data2 = try Data(contentsOf: url2)
                            let json2 = try JSONSerialization.jsonObject(with: data2, options: [])
                            print(json2)
                        } catch {
                            print(error2)
                        }
                    }
                }.resume()

   
                return
            }

            
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.xImageView.alpha = 0
                self.card.transform = CGAffineTransform.identity
            })
        }
      
        
    }
   
    
    //X
    @IBOutlet weak var xImageView: UIImageView!
    
    //EVENT DETAILS
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var locationTimeLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        print(eventName)
        if details[i] != "end"{
            eventNameLabel.text = String(eventName[i])
            detailsLabel.text = String(details[i])
            locationTimeLabel.text = String(locationsTimes[i])
            
            //even images
            eventImage.image = UIImage(named: String(eventIds[i])+".jpg")
            
        }
        else{
            eventNameLabel.text = "SORRY! Come back later"
            detailsLabel.text = "Come back later to explore more exciting events! New events are being posted by the hour. You can also change your preferences to explore more activites that may interest you."
            locationTimeLabel.text = "More events in progress!"
            
            
            eventImage.image = UIImage(named: "AA.jpg")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        eventImage.layer.cornerRadius = 10
        divisor = (view.frame.width/(-2))/0.25 //degree of tile
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

