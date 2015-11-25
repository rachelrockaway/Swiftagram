//
//  ViewController.swift
//  Swiftagram
//
//  Created by Rachel Stevenson on 11/23/15.
//  Copyright © 2015 rachelrockaway. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginTapped(sender: AnyObject) {
        
        let username = usernameField.text
        let password = passwordField.text
        
        PFUser.logInWithUsernameInBackground(username!, password: password!) {
            (user: PFUser?, error: NSError?) -> Void in
            
            if error == nil {
                //Successfully logged in.
                
                print("Successfully logged in.")
                
                let vc: AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("postsController")
                self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
                
        } else {
            //Error while logging in.
            
            
            let alertController = UIAlertController(title: "Error", message: "Error. Incorrect username/password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                
            self.presentViewController(alertController, animated: true, completion: nil)
            }
        
        }

    
    }

}

