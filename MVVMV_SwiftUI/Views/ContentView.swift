//
//  ContentView.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 02/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $loginViewModel.loginDataModel.userName)
                SecureField("Password", text: $loginViewModel.loginDataModel.userPassword)
                
                    
                NavigationLink(destination: HomeView(), isActive: $loginViewModel.loginDataModel.navigate, label: {
                    Button{
                        if(loginViewModel.validateUserInputs()){
                            loginViewModel.authenticateUser()
                        }
                    } label: {
                        Text("Login")
                    }.alert(isPresented: $loginViewModel.loginDataModel.isPresentingErrorAlert, content: {
                        Alert(title: Text("Alert"),message: Text(loginViewModel.loginDataModel.errorMessage),dismissButton: .cancel(Text("OK")))
                    })
                })
                
           
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
