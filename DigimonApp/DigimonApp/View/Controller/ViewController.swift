//
//  ViewController.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        signInButton.isEnabled = false
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if loginViewModel.doLoginValidation(emailID: emailLabel.text, password: passwordLabel.text){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let digimonListVC = storyboard.instantiateViewController(identifier: "DigimonTableViewControllerID")
            self.navigationController?.pushViewController(digimonListVC, animated: true)
        }else{
            let alertViewController = UIAlertController(title: "Wrong User or Password", message: "You entered wrong credentials", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.emailLabel.text = ""
                self.passwordLabel.text = ""
            }))
            self.present(alertViewController, animated: true)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // Since we do not have a logout button, every time the user comes back to the main page they are loggin themselves out.
        self.emailLabel.text = ""
        self.passwordLabel.text = ""
    }
}

