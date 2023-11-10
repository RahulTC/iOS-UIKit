//
//  AuthManager.swift
//  DigimonApp
//
//  Created by Rahul Adepu on 11/9/23.
//

import Foundation

// We can use "actor" instead of "final class"
final class AuthManager {
    
    static let shared = AuthManager()
    var authToken:String = ""
    var isLoggedIn = false
    
    private init(){
        
    }
    
    func doLogin(token: String){
        authToken = token
        isLoggedIn = true
    }
    
    
    func doLogout(){
        authToken = ""
        isLoggedIn = false
    }
}
