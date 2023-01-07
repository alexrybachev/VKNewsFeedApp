//
//  UserResponse.swift
//  VKNewsFeedApp
//
//  Created by Aleksandr Rybachev on 07.01.2023.
//

import Foundation

struct UserResponseWrapped: Codable {
    let response: [UserResponse]
}

struct UserResponse: Codable {
    let photo100: String?
}
