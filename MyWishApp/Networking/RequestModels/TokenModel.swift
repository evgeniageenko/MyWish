//
//  TokenModel.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 13.09.21.
//

import Foundation

//MARK: - Token
struct TokenModel: Codable {
    let access_token: String?
    let expires_in: String?
    let refresh_expires_in: Int?
    let refresh_token: String?

}
