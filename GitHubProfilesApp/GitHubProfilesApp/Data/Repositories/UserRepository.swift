//
//  UserRepository.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

protocol UserRepository {
    func getUsers() async throws -> [User]
    func getUserDetails(username: String) async throws -> UserDetails
}
