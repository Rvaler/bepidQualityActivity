//
//  LoginViewController.swift
//  Alamofire
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionLoginUser(sender: AnyObject) {
//        guard let username = self.txtUsername.text, password = self.txtPassword.text where username != "" && password != "" else{
//            print("Please fill username and password!")
//            return
//        }
        
        let params = [
            "user" : "ash",
            "password" : "mistyS2"
        ]
        
        AccountManager.sharedInstace.login("ash", password: "mistyS2") { (result) -> Void in
            if result {
                self.performSegueWithIdentifier("segueFromLoginToHome", sender: self)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
