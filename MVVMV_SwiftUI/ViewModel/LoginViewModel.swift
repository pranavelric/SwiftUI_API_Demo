//
//  LoginViewModel.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 03/09/23.
//

import Foundation

struct LoginDataModel{
     var errorMessage: String = String()
     var userName: String = String()
     var userPassword: String = String()
     var navigate: Bool = false
     var isPresentingErrorAlert: Bool = false
}

class LoginViewModel: ObservableObject{
    
    @Published var loginDataModel: LoginDataModel = LoginDataModel()
    private var loginValidation = LoginValidation()
    private var loginResource = LoginResource()
    
    //validate the user inputs
    func validateUserInputs() -> Bool{
        
        let result = loginValidation.validatieUserInputs(userName: loginDataModel.userName, userPassword: loginDataModel.userPassword)
        if(result.success == false){
            loginDataModel.errorMessage = result.errorMessage ?? "error occured"
            loginDataModel.isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    //call the api
    func authenticateUser(){
        let loginRequest = LoginRequest(userName: loginDataModel.userName,userPassword: loginDataModel.userPassword)
        loginResource.authenticate(loginRequest: loginRequest){ response in
            
            DispatchQueue.main.async {
                self.loginDataModel.navigate = true
            
                if(response?.message == nil){
                  
                }
                else{
                    self.loginDataModel.navigate = false
                    self.loginDataModel.errorMessage = response?.message ?? "Error occured"
                    self.loginDataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
    
}
