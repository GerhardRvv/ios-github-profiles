//
//  UserRepositoryImpl.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let apiService: GitHubApiService
    
    init(apiService: GitHubApiService) {
        self.apiService = apiService
    }
    
    func getUsers() async throws -> [User] {
        let response = try await apiService.fetchUsers()
        return response.map {
            User(
                id: $0.id,
                username: $0.login,
                avatarURL: $0.avatar_url
            )
        }
    }
    
    func getUserDetails(username: String) async throws -> UserDetails {
        let response = try await apiService.fetchUserDetails(username: username)
        return UserDetails(
            id: response.id,
            username: response.login,
            avatarURL: response.avatar_url,
            bio: response.bio,
            publicRepos: response.public_repos
        )
    }
}
