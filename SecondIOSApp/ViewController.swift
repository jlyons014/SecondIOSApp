//
//  ViewController.swift
//  SecondIOSApp
//
//  Created by Stacey Burke on 10/29/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import UIKit

//this class is the equivalent of the mainActivity java class in android
class ViewController: UIViewController {
    
    //gives viewcontroller access to the ImageView
    @IBOutlet weak var monsterImageView: UIImageView!
    
    //create an array of Strings that contains the names
    //of the different monsters
    var monsters = ["Astro", "Fluffy", "Munchie", "Squido"]
    
    //equivalent of the onCreate java onCreate class
    //called when the scene it controls is accessed
    //initialization is done here
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating an instance of a Joke
        let joke = Jokes()
        
        for joke in joke.jokes {
            //printing out jokes to debug area
            print(joke)
        }
        
    }
    //gives viewController ability to respond to the selection
    //of segments in the Segmented Control
    @IBAction func changeMonster(_ sender: UISegmentedControl) {
        
        //change the image in the ImageView based on
        //the segment selected
        
        //getting the index of the selected segment (0,1,2,3)
        let index = sender.selectedSegmentIndex
        
        //set the image of the imageview to a new UIImage
        //the new UIImage is the element in the monsters
        //array that matches the index
        monsterImageView.image = UIImage(named: monsters[index])
    }
    

}

