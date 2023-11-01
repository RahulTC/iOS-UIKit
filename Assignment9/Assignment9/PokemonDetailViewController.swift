//
//  PokemonDetailViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonDetailVCPokemonImage: UIImageView!
    @IBOutlet weak var pokemonDetailVCNameLabel: UILabel!
    
    var pokemonName:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelValue()
    }
    
    func setLabelValue(){
        pokemonDetailVCNameLabel.text = pokemonName ?? "None"
    }

}
