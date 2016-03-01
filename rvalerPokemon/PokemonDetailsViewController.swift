//
//  PokemonDetailsViewController.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit
import SwiftyJSON

class PokemonDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblHealth: UILabel!
    @IBOutlet weak var lblAttack: UILabel!
    @IBOutlet weak var lblDefense: UILabel!
    @IBOutlet weak var lblSpAttack: UILabel!
    @IBOutlet weak var lblSpDefense: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    
    var pokemon : JSON? {
        didSet {
            if let pokemon = self.pokemon {
                self.skills = pokemon["skills"]
                self.pokemonStatus = pokemon["status"]
            }
        }
    }
    
    var pokemonStatus : JSON?
    var skills : JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        if let pokemonStatus = self.pokemonStatus {
            self.lblAttack.text = String(pokemonStatus["attack"].numberValue)
            self.lblHealth.text = String(pokemonStatus["health"].numberValue)
            self.lblDefense.text = String(pokemonStatus["defense"].numberValue)
            self.lblSpAttack.text = String(pokemonStatus["spAttack"].numberValue)
            self.lblSpDefense.text = String(pokemonStatus["spDefense"].numberValue)
            self.lblSpeed.text = String(pokemonStatus["speed"].numberValue)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemonSkill", forIndexPath: indexPath) as! PokemonSkillTableViewCell
        let skill = self.skills[indexPath.row]

        cell.lblAccuracy.text = String(skill["accuracy"].numberValue)
        cell.lblDamageCategory.text = skill["damageCategory"].string
        cell.lblName.text = skill["name"].string
        cell.lblPower.text = String(skill["power"].numberValue)
        cell.lblPowerPoint.text = String(skill["powerPoint"].numberValue)
        cell.lblType.text = skill["type"].string
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
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
