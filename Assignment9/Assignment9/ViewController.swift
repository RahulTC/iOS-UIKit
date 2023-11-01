//
//  ViewController.swift
//  Assignment9
//
//  Created by Rahul Adepu on 10/31/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func pokedexButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pokdexListVC = storyboard.instantiateViewController(identifier: "pokedexListViewController")
        self.navigationController?.pushViewController(pokdexListVC, animated: true)
        
    }
    
}

