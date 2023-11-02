//
//  PokedexListViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 10/31/23.
//

import UIKit

class PokedexListViewController: UIViewController {
    
    @IBOutlet weak var pokedexTableView: UITableView!
    var userDataList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pokedexTableView.dataSource = self
        pokedexTableView.delegate = self
        
        let xib = UINib(nibName: "TableViewCell", bundle: nil)
        pokedexTableView.register(xib, forCellReuseIdentifier: "TableViewCellID")
        
        readDataFromJSONFile()
    }
    
    func readDataFromJSONFile(){
        let bundle = Bundle(for: PokedexListViewController.self)
        
        //get the path of the file which has the json data
        let url = bundle.url(forResource: "UserList", withExtension: "json")
        
        // unwrap the url since it is optional and can return nil value
        guard let url = url else { return }
        
        do{
            let jsonData = try Data(contentsOf: url)
            let finalOutput = try JSONDecoder().decode(UserModel.self, from: jsonData)
            userDataList = finalOutput.data
            DispatchQueue.main.async {
                self.pokedexTableView.reloadData()
            }
//            print(finalOutput)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
}

extension PokedexListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return pokemonGen1List.count
        case 1:
            return pokemonGen2List.count
        case 2:
            return pokemonGen3List.count
        default:
            return userDataList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let pokedexListCell = tableView.dequeueReusableCell(withIdentifier: "pokedexCellID", for: indexPath) as! PokedexListViewCell
            pokedexListCell.pokemonListNameLabel.text = pokemonGen1List[indexPath.row].name
            pokedexListCell.pokemonListImageView.image = pokemonGen1List[indexPath.row].listImage
            pokedexListCell.accessoryType = .disclosureIndicator
            return pokedexListCell
        case 1:
            let pokedexListCell = tableView.dequeueReusableCell(withIdentifier: "pokedexCellID", for: indexPath) as! PokedexListViewCell
            pokedexListCell.pokemonListNameLabel.text = pokemonGen2List[indexPath.row].name
            pokedexListCell.pokemonListImageView.image = pokemonGen2List[indexPath.row].listImage
            pokedexListCell.accessoryType = .disclosureIndicator
            return pokedexListCell
        case 2:
            let pokedexListCell = tableView.dequeueReusableCell(withIdentifier: "pokedexCellID", for: indexPath) as! PokedexListViewCell
            pokedexListCell.pokemonListNameLabel.text = pokemonGen3List[indexPath.row].name
            pokedexListCell.pokemonListImageView.image = pokemonGen3List[indexPath.row].listImage
            pokedexListCell.accessoryType = .disclosureIndicator
            return pokedexListCell
        default:
            let customTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
            customTableViewCell.customTableViewCellLabel.text = userDataList[indexPath.row].first_name
            return customTableViewCell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
}


extension PokedexListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboardPokedexListVC = UIStoryboard(name: "Main", bundle: nil)
        let pokemonDetailVC = storyboardPokedexListVC.instantiateViewController(withIdentifier: "PokemonDetailViewControllerID") as! PokemonDetailViewController
        switch indexPath.section {
        case 0:
            pokemonDetailVC.pokemonDetailImage = pokemonGen1List[indexPath.row].detailImage
            pokemonDetailVC.pokemonName = pokemonGen1List[indexPath.row].name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        case 1:
            pokemonDetailVC.pokemonDetailImage = pokemonGen2List[indexPath.row].detailImage
            pokemonDetailVC.pokemonName = pokemonGen2List[indexPath.row].name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        case 2:
//        default:
            pokemonDetailVC.pokemonDetailImage = pokemonGen3List[indexPath.row].detailImage
            pokemonDetailVC.pokemonName = pokemonGen3List[indexPath.row].name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        default:
            pokemonDetailVC.pokemonName = userDataList[indexPath.row].first_name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        }
        
    }
}
