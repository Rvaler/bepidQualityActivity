//
//  Trainer.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation
import Alamofire

class Trainer : NSObject {
    
    var name: String!
    var age: Int!
    var photo: String!
    var town: String!
    var onHandPokemons: [Pokemon]? = []
    
    init(name: String?, age: Int?, photo: String?, town: String?, onHandPokemons: [AnyObject]){
        
        self.name = name
        self.age = age
        self.photo = photo
        self.town = town
   
        for pokemon in onHandPokemons {
            let newPokemon = Pokemon(number: pokemon.objectForKey("number") as! Int, name: pokemon.objectForKey("name") as! String, icon: pokemon.objectForKey("icon") as! String, image: pokemon.objectForKey("image") as! String, level: pokemon.objectForKey("level") as! Int, type1: pokemon.objectForKey("type1") as! String, type2: pokemon.objectForKey("type2") as? String, status: pokemon.objectForKey("status") as! [String: Int], skills: pokemon.objectForKey("skills") as! [AnyObject])
            self.onHandPokemons?.append(newPokemon)
        }
    }
    
    static func loginTrainer(username: String, password: String) -> Bool {
        let params = [
            "user" : username,
            "password" : password
        ]
        
        Alamofire.request(.GET, "http://server03.local:60080/login", parameters: params, encoding: .URL).responseJSON { (result) -> Void in
            print("login")
            print(result)
        }
        return true
    }
    
}