//
//  AccountManager.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class AccountManager: NSObject {
    
    static let sharedInstace = AccountManager()
    
    var trainer : Trainer!
    
    func login(user: String, password: String, completion: (result: Bool) -> Void) {
        
        let params = [
            "user" : user,
            "password" : password
        ]
            

        Alamofire.request(.GET, "http://server03.local:60080/login", parameters: params, encoding: .URL).responseJSON { (response) -> Void in
            if let jsonDictionary = response.result.value as? [String: AnyObject] {
                if let loginResponse = jsonDictionary["response"] as? String where loginResponse == "true", let jsonData = jsonDictionary["data"] as? [String:AnyObject] {
                    print("Logged")
                    
                    self.trainer = Trainer(name: jsonData["name"] as? String, age: jsonData["age"] as? Int, photo: jsonData["photo"] as? String, town: jsonData["town"] as? String, onHandPokemons: (jsonData["onHandPokemons"] as? [AnyObject])!)
                    completion(result: true)
                    
                } else {
                    completion(result: false)
                    print("Not logged")
                }
            }
        }
    }
}