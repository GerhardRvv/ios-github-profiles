//
//  FetchUsersUseCase.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}
