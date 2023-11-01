//
//  PokedexListViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 10/31/23.
//

import UIKit

class PokedexListViewController: UIViewController {

    @IBOutlet weak var pokedexTableView: UITableView!
    
    let pokemonList = ["Pikachu", "Charizard", "Greninja", "Sceptile", "Lucario", "Infernape"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pokedexTableView.dataSource = self
        pokedexTableView.delegate = self
    }
    
    
}

extension PokedexListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokedexCell = tableView.dequeueReusableCell(withIdentifier: "pokedexCellID", for: indexPath)
        let pokedexListData = pokemonList[indexPath.row]
        pokedexCell.textLabel?.text = pokedexListData
        return pokedexCell
    }
}


extension PokedexListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemonList[indexPath.row]
        
        let storyboardPokedexListVC = UIStoryboard(name: "Main", bundle: nil)
        let pokemonDetailVC = storyboardPokedexListVC.instantiateViewController(withIdentifier: "PokemonDetailViewControllerID") as! PokemonDetailViewController
        print(pokemon)
        pokemonDetailVC.pokemonName = pokemon
        
        self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
    }
}
