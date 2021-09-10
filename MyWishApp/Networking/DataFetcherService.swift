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
//        networkDataFetcher.genericJSONDataWith(type: .POST, urlString: urlForRegistration, parameters: params, response: completion)
//        
////        networkDataFetcher.genericJSONDataWith(type: .GET, urlString: urlForRegistration,
////                                               parameters: params, response: completion)
//    }
    
    func myJson<T:Codable> (data: T?) {
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
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            print(responseJSON)
        }
    }
    task.resume()
}
    
    
}
