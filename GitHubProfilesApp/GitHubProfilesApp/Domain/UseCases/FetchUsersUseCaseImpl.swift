//
//  FetchUsersUseCaseImpl.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

class FetchUsersUseCaseImpl: FetchUsersUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [User] {
        return try await repository.getUsers()
    }
}
