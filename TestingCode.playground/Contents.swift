import UIKit

struct PokemonModelEnum {
    let name: String
    let gen: Int
}


let pokemonList =
[
PokemonModelEnum(name: "Pikachu",
                 gen: 1),
PokemonModelEnum(name: "Lucario",
                 gen: 4),
PokemonModelEnum(name: "Charizard",
                 gen: 1),
PokemonModelEnum(name: "Sceptile",
                 gen: 3),
PokemonModelEnum(name: "Infernape",
                 gen: 4),
PokemonModelEnum(name: "Greninja",
                 gen: 6)
]

let pokemonGenCount = Set(pokemonList.map{$0.gen}).count
print(pokemonGenCount)

let pokemonGenSet = Array(Set(pokemonList.map{$0.gen})).sorted()
print(pokemonGenSet)

var array = Dictionary(grouping: pokemonList) { $0.gen }
for(key, value) in array {
    print("\(key) = \(value)")
}
