//
//  PokemonSkillTableViewCell.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 3/1/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class PokemonSkillTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAccuracy: UILabel!
    @IBOutlet weak var lblDamageCategory: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPower: UILabel!
    @IBOutlet weak var lblPowerPoint: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
