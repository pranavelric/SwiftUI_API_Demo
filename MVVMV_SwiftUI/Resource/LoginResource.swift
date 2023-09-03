//
//  LoginResource.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 03/09/23.
//

import Foundation

struct LoginResource{
 
    func authenticate(loginRequest: LoginRequest, completionHandler: @escaping(_ result: LoginResponse?)-> Void){
        
        let loginUrl = URL(string: ApiEndpoints.login)!

        
        do{
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            HttpUtility.shared.postData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self){ response in
                _ = completionHandler(response)
            }
        }
        catch let error{
            print(error)
        }
        
        
    }
    
}
