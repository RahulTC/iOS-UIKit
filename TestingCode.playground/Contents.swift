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


enum genList: CaseIterable{
    case gen1 = 1
    case gen2 = 2
    case gen3 = 3
    case gen4 = 4
    case gen5 = 5
    case gen6 = 6
}

let genCase = 1
switch genCase {
case 1:
    print("Gen 1")
case 2:
    print("Gen 2")
case 3:
    print("Gen 3")
case 4:
    print("Gen 4")
case 5:
    print("Gen 5")
default:
    print("Gen 6")
}
