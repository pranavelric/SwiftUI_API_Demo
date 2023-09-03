//
//  LoginViewModel.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 03/09/23.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var errorMessage: String = String()
    @Published var userName: String = String()
    @Published var userPassword: String = String()
    @Published var navigate: Bool = false
    @Published var isPresentingErrorAlert: Bool = false
    private var loginValidation = LoginValidation()
    private var loginResource = LoginResource()
    
    //validate the user inputs
    func validateUserInputs() -> Bool{
        
        let result = loginValidation.validatieUserInputs(userName: userName, userPassword: userPassword)
        if(result.success == false){
            errorMessage = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    //call the api
    func authenticateUser(){
        let loginRequest = LoginRequest(userName: userName,userPassword: userPassword)
        loginResource.authenticate(loginRequest: loginRequest){ response in
            if(response?.message == nil){
                DispatchQueue.main.async {
                    self.navigate = true
                }
            }
            else{
                DispatchQueue.main.async {
                    self.navigate = false
                    self.errorMessage = response?.message ?? "Error occured"
                    self.isPresentingErrorAlert = true
                }
            }
        }
    }
    
}
