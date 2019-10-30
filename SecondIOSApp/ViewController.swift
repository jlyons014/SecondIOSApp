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
    
    //IBOutlets are created as Optionals
    // this means that they may contain a value
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var tipPercentTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    //create string that will store the calculated tip
    //sent to the newViewController
    var calculatedTip = ""
    
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
    
    //gives viewController ability to respond to button being pushed
    @IBAction func calculateTip(_ sender: UIButton) {
        
        var dTip = 0.0
        var dAmount = 0.0
        var dPercent = 0.0
        
        //get values in the TextFields, if a value exists
        //and assign the values to constants the textfields are
        //optionals
        if let amount = amountTextField.text, let percent =
            tipPercentTextField.text {
            
            // trim whitespace that may exist at the beginning or the
            //ending of the constants
            let trimmedAmount = amount.trimmingCharacters(in: .whitespaces)
            let trimmedPercent = percent.trimmingCharacters(in: .whitespaces)
            
            //check to make sure the trimmed constants aren't empty
            if (!trimmedAmount.isEmpty && !trimmedPercent.isEmpty) {
                
                //convert trimmed constants to Doubles
                dAmount = Double(trimmedAmount)!
                dPercent = Double(trimmedPercent)!
                
                //calculate the tip
                dTip = dAmount * dPercent
            }
        }
        
        //convert calculated tip to a string, display in label
        tipLabel.text = "Tip is $\(String(dTip))"
        
        //stores the calculated tip in the string
        calculatedTip = "Tip is $\(String(dTip))"
        
        //segue to newViewController
        //this method requires the prepare method to be overridden
        performSegue(withIdentifier: "GoToNewView", sender: nil)
    }
    
    //this method created an instance of the view controller thats being
    //segued to and it passes the view controller the calcd tip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //if we are segueing to the viewcontroller that has the identifier
        //goToNewView
        if segue.identifier == "GoToNewView" {
            //create an instance of that View Controller
            let newViewController = segue.destination as? NewViewController
            
            newViewController?.tipToShow = calculatedTip
            
        }
    }
    
}

