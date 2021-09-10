//
//  ResponseModel.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 9.09.21.
//

import Foundation

//MARK: - USER - POST RESPONSE
struct Families: Codable {
    let id: Int?
    let name: String?
}
struct UserPostResponse: Codable{
    let id: Int
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let role: String
    let gender: String
    let families: [Families]
}

//MARK: - FAMILY - POST RESPONSE
struct Members: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let role: String
    let gender: String
}

struct FamilyPostResponse: Codable {
    let id: Int
    let name: String
    let members: [Members]
}


//MARK: - INVITATION - POST RESPONSE
struct InvitationPostResponse: Codable {
    let string: String?
}


//MARK: - WISH - POST RESPONSE
struct WishPostResponse: Codable {
    let id: Int
    let userID: Int
    let family: Int
    let name: String
    let description: String
    let status: String
    let value: Int
}
