//
//  Pokemon.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation

class Pokemon {
    
    var number: Int!
    var name: String!
    var icon: String!
    var image: String!
    var level: Int!
    var type1: String!
    var type2: String?
    var status: Status!
    var skills: [Skill]? = []
    
    init(number: Int, name: String, icon: String, image: String, level: Int, type1: String, type2: String?, status: [String: Int], skills: [AnyObject]) {
        
        print("statusSSSS")
        print(status)
        
        self.number = number
        self.name = name
        self.icon = icon
        self.image = image
        self.level = level
        self.type1 = type1
        self.type2 = type2
        
        self.status = Status(health: status["health"]!, attack: status["attack"]!, defense: status["defense"]!, spAttack: status["spAttack"]!, spDefense: status["spDefense"]!, speed: status["speed"]!)
        
        for skill in skills {
            let newSkill = Skill(name: skill.valueForKey("name") as! String, type: skill.valueForKey("type") as! String, damageCategory: skill.valueForKey("damageCategory") as! String, power: skill.valueForKey("power") as! Int, accuracy: skill.valueForKey("accuracy") as! Int, powerPoint: skill.valueForKey("powerPoint") as! Int)
            self.skills?.append(newSkill)
        }
    }
}