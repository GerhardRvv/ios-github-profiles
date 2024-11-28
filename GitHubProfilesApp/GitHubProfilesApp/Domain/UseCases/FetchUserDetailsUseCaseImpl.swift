//
//  FetchUserDetailsUseCaseImpl.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

class FetchUserDetailsUseCaseImpl: FetchUserDetailsUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(username: String) async throws -> UserDetails {
        return try await repository.getUserDetails(username: username)
    }
}
