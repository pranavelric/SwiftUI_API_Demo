//
//  LoginResponse.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 02/09/23.
//

import Foundation

struct LoginResponse : Decodable{
    let userName: String?
    let userID: Int?
    let email : String?
    let firstName: String?
    let lastName: String?
    let gender : String?
    let image : String?
    let token : String?
    let message: String?
    
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case userID = "id"
        case email = "email"
        case firstName
        case lastName
        case gender
        case image
        case token
        case message
    }
}
