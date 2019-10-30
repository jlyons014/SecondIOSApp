//
//  NewViewController.swift
//  SecondIOSApp
//
//  Created by Stacey Burke on 10/29/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    // gives NewViewController access to label
    @IBOutlet weak var tipLabel: UILabel!
    
    //create string that will store the calculated tip sent from the original viewController
    
    var tipToShow = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display calculatd tip sent from original viewController
        tipLabel.text = tipToShow
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        
        //segue to newViewController
        //this method requires the prepare method to be overridden
        performSegue(withIdentifier: "GoToTableView", sender: nil)
    }
    
    //this method created an instance of the view controller thats being
    //segued to
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //if we are segueing to the viewcontroller that has the identifier
        //goToNewView
        if segue.identifier == "GoToTableView" {
            //create an instance of that View Controller
            _ = segue.destination as? NewTableViewController
            
            
        }
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
