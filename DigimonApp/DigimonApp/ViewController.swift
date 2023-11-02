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
    
    let setUsername = "rahul@gmail.com"
    let setPassword = "Pass@123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        signInButton.isEnabled = false
    }

    func doLoginValidation(emailID:String?, password:String?) -> Bool{
        var isValid = false
        guard let emailID = emailID else { return isValid }
        guard let password = password else { return isValid }
        
        let isValidPassword = password.count >= 6
        let emailRegex = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: emailID)
        
        var isUserValid = false
        if (emailID == setUsername && password == setPassword){
            isUserValid = true
        }
        
        print("Password is ->\(password) it's validity is \(isValidPassword)")
        print("Email is ->\(emailID) it's validity is \(isEmailValid)")
        print("User's validity is \(isUserValid)")
        
        isValid = isEmailValid && isValidPassword && isUserValid
        
        return isValid
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if doLoginValidation(emailID: emailLabel.text, password: passwordLabel.text){
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

