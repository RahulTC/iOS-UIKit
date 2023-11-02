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
        let pokdexListVC = storyboard.instantiateViewController(identifier: "PokemonListViewControllerID")
        self.navigationController?.pushViewController(pokdexListVC, animated: true)
    }
    
    @IBAction func pokedexGridViewButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pokdexGridVC = storyboard.instantiateViewController(identifier: "PokemonGridViewControllerID")
        self.navigationController?.pushViewController(pokdexGridVC, animated: true)
    }
    
    @IBAction func pokedexWebViewButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pokdexWebVC = storyboard.instantiateViewController(identifier: "WebViewControllerID")
        self.navigationController?.pushViewController(pokdexWebVC, animated: true)
    }
    
    
    func doLoginValidation(emailID:String?, password:String?) -> Bool{
        var isValid = false
        guard let emailID = emailID else { return isValid }
        guard let password = password else { return isValid }
        
        let isValidPassword = password.count >= 6
        let emailRegex = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: emailID)
        
        return isEmailValid && isValidPassword
    }
}

