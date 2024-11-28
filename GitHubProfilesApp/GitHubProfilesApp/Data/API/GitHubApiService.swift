//
//  GitHubApiService.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

protocol GitHubApiService {
    func fetchUsers() async throws -> [GitHubUserResponse]
    func fetchUserDetails(username: String)  async throws -> GitHubUserDetailsResponse
}

class GitHubApiServiceImpl: GitHubApiService {
    
    func fetchUsers() async throws -> [GitHubUserResponse] {
        let url = URL(string: "https://api.github.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([GitHubUserResponse].self, from: data)
    }
    
    func fetchUserDetails(username: String) async throws -> GitHubUserDetailsResponse {
        let url = URL(string: "https://api.github.com/users/\(username)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(GitHubUserDetailsResponse.self, from: data)
    }
}
