//
//  LoginViewModel.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/9/23.
//

import Foundation

class LoginViewModel {
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
