//
//  UserModel.swift
//  Assignment9
//
//  Created by Rahul Adepu on 11/1/23.
//

import UIKit

struct UserModel:Decodable{
    let page: Int
    let per_page, total, total_pages: Int
    let data:[User]
    let support:Support
}

struct User:Decodable{
    let id:Int
    let email, first_name, last_name, avatar:String
}

struct Support:Decodable{
    let url:String
    let text:String
}
