//
//  PokemonGridViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit

class PokemonGridViewController: UIViewController {

    @IBOutlet weak var pokedexGridView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pokedexGridView.dataSource = self
        pokedexGridView.delegate = self
    }
    

}

extension PokemonGridViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return pokemonGen1List.count
        case 1:
            return pokemonGen2List.count
        case 2:
            return pokemonGen3List.count
        default:
            return pokemonGen4List.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            let pokedexGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonGridViewID", for: indexPath) as! GridViewCell
            pokedexGridCell.pokemonGridImageView.image = pokemonGen1List[indexPath.row].detailImage
            pokedexGridCell.pokemonGridNameLabel.text = pokemonGen1List[indexPath.row].name
            return pokedexGridCell
        case 1:
            let pokedexGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonGridViewID", for: indexPath) as! GridViewCell
            pokedexGridCell.pokemonGridImageView.image = pokemonGen2List[indexPath.row].detailImage
            pokedexGridCell.pokemonGridNameLabel.text = pokemonGen2List[indexPath.row].name
            return pokedexGridCell
        case 2:
            let pokedexGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonGridViewID", for: indexPath) as! GridViewCell
            pokedexGridCell.pokemonGridImageView.image = pokemonGen3List[indexPath.row].detailImage
            pokedexGridCell.pokemonGridNameLabel.text = pokemonGen3List[indexPath.row].name
            return pokedexGridCell
        default:
            let pokedexGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonGridViewID", for: indexPath) as! GridViewCell
            pokedexGridCell.pokemonGridImageView.image = pokemonGen4List[indexPath.row].detailImage
            pokedexGridCell.pokemonGridNameLabel.text = pokemonGen4List[indexPath.row].name
            return pokedexGridCell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GridSectionID", for: indexPath)
        guard let sectionHeaderView = headerView as? SectionHeaderCollectionReusableView else { return headerView }
        
        switch indexPath.section {
        case 0:
            sectionHeaderView.sectionHeaderlabel.text = "Gen \(pokemonGen1List[indexPath.row].gen)"
            return sectionHeaderView
        case 1:
            sectionHeaderView.sectionHeaderlabel.text = "Gen \(pokemonGen2List[indexPath.row].gen)"
            return sectionHeaderView
        case 2:
            sectionHeaderView.sectionHeaderlabel.text = "Gen \(pokemonGen3List[indexPath.row].gen)"
            return sectionHeaderView
        default:
            sectionHeaderView.sectionHeaderlabel.text = "Gen \(pokemonGen4List[indexPath.row].gen)"
            return sectionHeaderView
        }
        
        
    }
    
}

extension PokemonGridViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardPokedexGridVC = UIStoryboard(name: "Main", bundle: nil)
        let pokemonDetailVC = storyboardPokedexGridVC.instantiateViewController(withIdentifier: "PokemonDetailViewControllerID") as! PokemonDetailViewController
        
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
            pokemonDetailVC.pokemonDetailImage = pokemonGen3List[indexPath.row].detailImage
            pokemonDetailVC.pokemonName = pokemonGen3List[indexPath.row].name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        default:
            pokemonDetailVC.pokemonDetailImage = pokemonGen4List[indexPath.row].detailImage
            pokemonDetailVC.pokemonName = pokemonGen4List[indexPath.row].name
            
            self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
        }
    }
}
