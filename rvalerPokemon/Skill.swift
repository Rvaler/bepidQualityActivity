//
//  Skill.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation

class Skill : NSObject {
    
    var name: String!
    var type: String!
    var damageCategory: String!
    var power: Int!
    var accuracy: Int!
    var powerPoint: Int!
    
    init(name: String, type: String, damageCategory: String, power: Int, accuracy: Int, powerPoint: Int) {
        
        self.name = name
        self.type = type
        self.damageCategory = damageCategory
        self.power = power
        self.accuracy = accuracy
        self.powerPoint = powerPoint
        
    }
}