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
                TextField("Username", text: $loginViewModel.userName)
                SecureField("Password", text: $loginViewModel.userPassword)
                
                    
                NavigationLink(destination: HomeView(), isActive: $loginViewModel.navigate, label: {
                    Button{
                        if(loginViewModel.validateUserInputs()){
                            loginViewModel.authenticateUser()
                        }
                    } label: {
                        Text("Login")
                    }.alert(isPresented: $loginViewModel.isPresentingErrorAlert, content: {
                        Alert(title: Text("Alert"),message: Text(loginViewModel.errorMessage),dismissButton: .cancel(Text("OK")))
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
