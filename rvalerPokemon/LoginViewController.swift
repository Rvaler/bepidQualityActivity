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
        self.btnLogin.layer.cornerRadius = 2.0
        
    }
    
    @IBAction func actionLoginUser(sender: AnyObject) {
        
        guard let _username = self.txtUsername.text, _password = self.txtPassword.text where _username != "" && _password != "" else {
            print("Please fill username and password!")
            return
        }
        
        AccountManager.sharedInstace.login(_username, password: _password) { (result) -> Void in
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
