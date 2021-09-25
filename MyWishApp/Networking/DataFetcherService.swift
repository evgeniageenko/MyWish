//
//  DataFetcherService.swift
//  Papa Johns Codes
//
//  Created by Aleksei Elin on 19.09.2019.
//  Copyright © 2019 Aleksei Elin. All rights reserved.
//

import Foundation

class DataFetcherService {    
    var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    //    func UserRegistration(completion: @escaping (UserRegestrationResponseModel?) -> Void) {
    //        let urlForRegistration = "http://34.125.209.19:9090/api/v1/user"
    //                let params: [String : String] = ["firstName" : "Evgeni",
    //                                                 "lastName" : "Ageenko",
    //                                                 "dateOfBirth" : "1996-06-06",
    //                                                 "role" : "parent",
    //                                                 "gender" : "male",
    //                                                 "email" : "evgeniageenko@gmail.com",
    //                                                 "password" : "123"]
    //
    //        networkDataFetcher.genericJSONDataWith(type: .GET, urlString: urlForRegistration,
    //                                               parameters: params, response: completion)
    //    }
    
    //MARK: - Create User Method
    func myJson<T:Codable> (data: T?, completion: ((UserPostRequest) -> Void)?) {
        // prepare json data
        let jsonBody = try? JSONEncoder().encode(data)
        
        // create post request
        let url = URL(string: "http://34.125.209.19:9090/api/v1/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            // if let responseJSON = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
            
            if let userModel = try? JSONDecoder().decode(UserPostRequest.self, from: data) {
                completion?(userModel)
                
            }
            
            //}
        }
        task.resume()
    }
    
    //MARK: - Token method
    func requestAccessAndRefreshTokens(email: String, password: String, completion: (([String : Any]) -> Void)?) {
        // Request Preconfiguration
        let requestHeaders: [String : String] = ["Content-Type" : "application/x-www-form-urlencoded"]
        
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [URLQueryItem(name: "client_id", value: "ui-app"),
                                            URLQueryItem(name: "username", value: email),
                                            URLQueryItem(name: "password", value: password),
                                            URLQueryItem(name: "grant_type", value: "password")]
        
        //Request Configuration
        var request = URLRequest(url: URL(string: "http://34.125.209.19:9999/auth/realms/mywish/protocol/openid-connect/token")!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        
        //Perfoming requst
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No token")
                return
            }
                        let token = try? JSONSerialization.jsonObject(with: data, options: [])
            if let token = token as? [String : Any]  {
                           completion?(token)
//                            print(token)
        }
//            if let token = try? JSONDecoder().decode(TokenModel.self, from: data) {
//                completion?(token)
//                print(token)
//
//            }
        }
        task.resume()
    }
}
    
    
    
    //MARK: - Token method TWO
//    func requestAccessAndRefreshTokensTWO(email: String, password: String) {
//        // Request Preconfiguration
//        let requestHeaders: [String : String] = ["Content-Type" : "application/x-www-form-urlencoded"]
//
//        var requestBodyComponents = URLComponents()
//        requestBodyComponents.queryItems = [URLQueryItem(name: "client_id", value: "ui-app"),
//                                            URLQueryItem(name: "username", value: email),
//                                            URLQueryItem(name: "password", value: password),
//                                            URLQueryItem(name: "grant_type", value: "password")]
//
//        //Request Configuration
//        var request = URLRequest(url: URL(string: "http://34.125.209.19:9999/auth/realms/mywish/protocol/openid-connect/token")!)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = requestHeaders
//        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
//
//        //Perfoming requst
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No token")
//                return
//            }
//                        let token = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let token = token as? TokenModel {
//                print(token)
//
//        }
//
//
//
//        }
//        task.resume()
//    }
    
    
    //MARK: - Create User Method TWO
//    func myJsonTWO<T:Codable> (data: T?, closure: (String, String) -> Void) {
//        // prepare json data
//        let jsonBody = try? JSONEncoder().encode(data)
//
//        // create post request
//        let url = URL(string: "http://34.125.209.19:9090/api/v1/user")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        // insert json data to the request
//        request.httpBody = jsonBody
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No data")
//                return
//            }
//
//            //            if let responseJSON = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
//
//            if let userModel = try? JSONDecoder().decode(UserPostRequest.self, from: data) {
//
//
//
//
//            }
//
//            //            }
//        }
//        closure("1@mail.ru", "12345678")
//
//        task.resume()
//    }
//



