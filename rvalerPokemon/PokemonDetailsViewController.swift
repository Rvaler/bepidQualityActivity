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
    
    var pokemon : Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        if let pokemonStatus = self.pokemon?.status {
            self.lblAttack.text = String(pokemonStatus.attack)
            self.lblHealth.text = String(pokemonStatus.health)
            self.lblDefense.text = String(pokemonStatus.defense)
            self.lblSpAttack.text = String(pokemonStatus.spAttack)
            self.lblSpDefense.text = String(pokemonStatus.defense)
            self.lblSpeed.text = String(pokemonStatus.speed)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pokemonSkill", forIndexPath: indexPath) as! PokemonSkillTableViewCell
        if let skill = self.pokemon?.skills![indexPath.row] {
            cell.lblAccuracy.text = String(skill.accuracy)
            cell.lblDamageCategory.text = skill.damageCategory
            cell.lblName.text = skill.name
            cell.lblPower.text = String(skill.power)
            cell.lblPowerPoint.text = String(skill.powerPoint)
            cell.lblType.text = skill.type
        }

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemon = self.pokemon {
            return (pokemon.skills?.count)!
        } else {
            return 0
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
