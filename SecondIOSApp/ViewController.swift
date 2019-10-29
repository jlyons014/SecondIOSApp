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


}

