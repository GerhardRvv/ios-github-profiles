//
//  UserDetails.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

struct UserDetails: Equatable {
    let id: Int
    let username: String
    let avatarURL: String
    let bio: String?
    let publicRepos: Int
}
