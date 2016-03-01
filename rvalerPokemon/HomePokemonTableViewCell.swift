//
//  HomePokemonTableViewCell.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class HomePokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTypeOne: UILabel!
    @IBOutlet weak var lblTypeTwo: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
