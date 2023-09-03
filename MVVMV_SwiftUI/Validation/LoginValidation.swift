//
//  LoginValidation.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 03/09/23.
//

import Foundation

struct ValidationResult{
    var success: Bool = false
    var errorMessage: String?
}

struct LoginValidation{
    
    // validate the user inputs
    func validatieUserInputs(userName: String, userPassword: String) -> ValidationResult{
        if(userName.isEmpty){
          return ValidationResult(success: false, errorMessage: "User email is empty")
        }
        if (userPassword.isEmpty){
            return ValidationResult(success: false, errorMessage: "User password is empty")
        }
        
        return ValidationResult(success: true,errorMessage: nil)
    }
    

}
