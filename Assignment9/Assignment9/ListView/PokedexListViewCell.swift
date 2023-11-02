//
//  pokdexListViewCell.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit

class PokedexListViewCell: UITableViewCell {

    @IBOutlet weak var pokemonListImageView: UIImageView!
    @IBOutlet weak var pokemonListNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
