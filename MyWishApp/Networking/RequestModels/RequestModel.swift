//
//  RequestModel.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 9.09.21.
//

import Foundation


//MARK: - USER - POST REQUEST
struct UserPostRequest: Codable {
    let email: String?
    let password: String?
    let firstName: String?
    let lastName: String?
    let dateOfBirth: String?
    let role: String?
    let gender: String?
}

//MARK: - FAMILY - POST REQUEST
struct FamilyPostRequest: Codable {
    let name: String
}


//MARK: - INVITATION - POST REQUEST
struct InvitationPostRequest: Codable {
    let famalyId: Int
    let role: String
}


//MARK: - WISH - POST REQUEST
struct WishPostRequest: Codable {
    let name: String
    let description: String
}
