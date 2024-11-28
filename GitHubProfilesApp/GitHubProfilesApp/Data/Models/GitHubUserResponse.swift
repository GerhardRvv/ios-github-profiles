//
//  UserResponse.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

struct GitHubUserResponse: Codable {
    let id: Int
    let login: String
    let avatar_url: String
}
