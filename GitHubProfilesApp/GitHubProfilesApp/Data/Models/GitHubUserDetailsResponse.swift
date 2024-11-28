//
//  GitHubUserDetailsResponse.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

struct GitHubUserDetailsResponse: Codable {
    let id: Int
    let login: String
    let avatar_url: String
    let bio: String?
    let public_repos: Int
}
