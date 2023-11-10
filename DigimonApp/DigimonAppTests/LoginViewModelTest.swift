//
//  LoginViewModelTest.swift
//  DigimonAppTests
//
//  Created by Rahul Adepu on 11/9/23.
//

import XCTest
@testable import DigimonApp


final class LoginViewModelTest: XCTestCase {
    var loginViewModel:LoginViewModel!
    
    override func setUpWithError() throws {
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }
    
    func testLogin_InvalidEmailAndPassword_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahulade@gmail.com", password: "P123")
        print("InvalidEmailAndPassword - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_ValidEmailAndInvalidPassword_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahul@gmail.com", password: "P123")
        print("ValidEmailAndInvalidPassword - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_InvalidEmailAndValidPassword_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahulade@gmail.com", password: "Pass@123")
        print("InvalidEmailAndValidPassword - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_ValidCredentials_Sucess() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahul@gmail.com", password: "Pass@123")
        print("ValidCredentials - \(result)")
        XCTAssertTrue(result)
    }
    
    func testLogin_EmptyEmailAndPassword_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "", password: "")
        print("EmptyEmailAndPassword - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_EmailWithoutAtSymbol_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahulgmail.com", password: "Pass@123")
        print("EmailWithoutAtSymbol - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_EmailWithoutDot_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahul@gmailcom", password: "Pass@123")
        print("EmailWithoutDo - \(result)")
        XCTAssertFalse(result)
    }
    
    func testLogin_PasswordWithLessThanSixChar_Failure() throws {
        let result = loginViewModel.doLoginValidation(emailID: "rahul@gmail.com", password: "Pa123")
        print("PasswordWithLessThanSixChar - \(result)")
        XCTAssertFalse(result)
    }
    

}
