//
//  DependencyContainer.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

class DependencyContainer {
    let apiService: GitHubApiService
    let userRepository: UserRepository
    let fetchUsersUseCase: FetchUsersUseCase
    let fetchUserDetailsUseCase: FetchUserDetailsUseCase
    
    init() {
        self.apiService = GitHubApiServiceImpl()
        self.userRepository = UserRepositoryImpl(apiService: apiService)
        self.fetchUsersUseCase = FetchUsersUseCaseImpl(repository: userRepository)
        self.fetchUserDetailsUseCase = FetchUserDetailsUseCaseImpl(repository: userRepository)
    }
}
