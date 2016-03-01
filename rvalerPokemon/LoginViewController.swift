//
//  LoginViewController.swift
//  Alamofire
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 Alamofire. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let params = [
            "user" : "ash",
            "password" : "mistyS2"
        ]
        
//        Alamofire.request(.GET, "http://server03.local:60080/login", parameters: params, encoding: .URL).responseJSON { (result) -> Void in
//            print(result)
//            
//            let json = JSON(data: (result.data! ))
//            print(json)
//            if let userName = json["data"]["name"].string {
//                //Now you got your value
//                print(userName)
//            }
//        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLoginUser(sender: AnyObject) {
//        guard let username = self.txtUsername, password = self.txtPassword.text where username != "" && password != "" else{
//            print("Please fill username and password!")
//            return
//        }
        
//        let params = [
//            "user" : username,
//            "password" : password
//        ]
        
//        Alamofire.request(.GET, "http://server03.local:60080/login", parameters: params, encoding: .URL).responseJSON { (result) -> Void in
//            print(result)
//            
//            let json = JSON(data: (result.data! ))
//            print(json)
//            if let userName = json["data"]["name"].string {
//                //Now you got your value
//                print(userName)
//            }
//        }
        self.performSegueWithIdentifier("segueFromLoginToHome", sender: nil)
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
