//
//  PokemonModel.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit

struct PokemonModel {
    let name: String
    let gen: Int
    let listImage: UIImage
    let detailImage: UIImage
}


let pokemonGen1List =
[
    PokemonModel(name: "Pikachu",
                 gen: 1,
                 listImage: UIImage(named: "pikachuListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "pikachuDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!),
    PokemonModel(name: "Charizard",
                 gen: 1,
                 listImage: UIImage(named: "charizardListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "charizardDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!)
]

let pokemonGen2List =
[
    PokemonModel(name: "Tyranitar",
                 gen: 2,
                 listImage: UIImage(named: "tyranitarListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "tyranitarDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!),
    PokemonModel(name: "Typhlosion",
                 gen: 2,
                 listImage: UIImage(named: "typhlosionListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "typhlosionDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!)
]

let pokemonGen3List =
[
    PokemonModel(name: "Sceptile",
                 gen: 3,
                 listImage: UIImage(named: "sceptileListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "sceptileDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!),
    PokemonModel(name: "Gardevoir",
                 gen: 3,
                 listImage: UIImage(named: "gardevoirListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "gardevoirDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!)
]

let pokemonGen4List =
[
    PokemonModel(name: "Lucario",
                 gen: 4,
                 listImage: UIImage(named: "lucarioListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "lucarioDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!),
    PokemonModel(name: "Infernape",
                 gen: 4,
                 listImage: UIImage(named: "infernapeListImages") ?? UIImage(systemName: "questionmark.circle.fill")!,
                 detailImage: UIImage(named: "infernapeDetailImages") ?? UIImage(systemName: "questionmark.circle.fill")!)
]
