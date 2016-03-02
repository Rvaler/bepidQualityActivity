//
//  Status.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation

class Status: NSObject {
    
    var health: Int!
    var attack: Int!
    var defense: Int!
    var spAttack: Int!
    var spDefense: Int!
    var speed: Int!
    
    init(health: Int, attack: Int, defense: Int, spAttack: Int, spDefense: Int, speed: Int){
        
        self.health = health
        self.attack = attack
        self.defense = defense
        self.spAttack = spAttack
        self.spDefense = spDefense
        self.speed = speed
        
    }
}