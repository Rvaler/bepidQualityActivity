//
//  HomeTrainerTableViewCell.swift
//  rvalerPokemon
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class HomeTrainerTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblTown: UILabel!
    
    var trainer : NSDictionary?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgPhoto.layer.cornerRadius = self.imgPhoto.frame.size.width / 2
        self.imgPhoto.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
