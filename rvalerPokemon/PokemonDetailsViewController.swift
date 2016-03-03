//
//  PokemonDetailsViewController.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblHealth: UILabel!
    @IBOutlet weak var lblAttack: UILabel!
    @IBOutlet weak var lblDefense: UILabel!
    @IBOutlet weak var lblSpAttack: UILabel!
    @IBOutlet weak var lblSpDefense: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var imgPokemonImg: UIImageView!
    
    var pokemon : Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        if let pokemonStatus = self.pokemon?.status {
            self.lblAttack.text = "Attack: " + String(pokemonStatus.attack)
            self.lblHealth.text = "Health: " + String(pokemonStatus.health)
            self.lblDefense.text = "Defense: " + String(pokemonStatus.defense)
            self.lblSpAttack.text = "Sp Attack: " + String(pokemonStatus.spAttack)
            self.lblSpDefense.text = "Sp Defense: " + String(pokemonStatus.spDefense)
            self.lblSpeed.text = "Speed: " + String(pokemonStatus.speed)
            
            if let urlString = self.pokemon?.image, url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {
                self.imgPokemonImg.image = UIImage(data: data)
            }
        }
        
        // Do any additional setup after loading the view.
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
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Skills"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon!.skills!.count
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
