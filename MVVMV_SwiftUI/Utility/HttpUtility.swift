//
//  HttpUtility.swift
//  MVVMV_SwiftUI
//
//  Created by Pranav Choudhary on 02/09/23.
//

import Foundation


final class HttpUtility{
    
    static let shared = HttpUtility()
    private init(){}

    
    func getData<T: Decodable>(requestUrl:URL, requestType: T.Type,completionHandler: @escaping(_ result: T?)-> Void){
            URLSession.shared.dataTask(with: requestUrl){ (data,response,error) in
                
                if(error == nil && data != nil && data?.count != 0){
                    let decoder = JSONDecoder()
                    do{
                        let result  = try decoder.decode(T.self, from: data!)
                        completionHandler(result)
                    }
                    catch let error{
                        print("Error while decoding \(error)")
                    }
                }
                
            }
    }
    
    func postData<T:Decodable>(requestUrl:URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping(_ result:T?)-> Void){
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody   = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in

            if( error == nil && data != nil && data?.count != 0){
                         let decoder = JSONDecoder()
                         
                         do{
                             let result =  try decoder.decode(T.self, from: data!)
                             completionHandler(result)
                         }
                         catch let error{
                             debugPrint("error while decoding \(error.localizedDescription)")
                         }
                     }
        }.resume()
    }
}
