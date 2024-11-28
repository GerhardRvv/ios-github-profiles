//
//  FetchUserDetailsUseCase.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

protocol FetchUserDetailsUseCase {
    func execute(username: String)  async throws -> UserDetails
}
