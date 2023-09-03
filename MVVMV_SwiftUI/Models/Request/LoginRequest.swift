//
//  LoginRequest.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 02/09/23.
//

import Foundation

struct LoginRequest : Codable
{
    var userName, userPassword: String?
    
    
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case userPassword = "password"
    }
}
