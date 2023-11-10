//
//  DigimonTableViewCell.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

class DigimonTableViewCell: UITableViewCell {

    @IBOutlet weak var digimonListImage: UIImageView!
    @IBOutlet weak var digimonListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
