//
//  UserListViewModel.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users: [UserViewData] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchUsersUseCase: FetchUsersUseCase
    
    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
    
    func loadUsers() async {
        isLoading = true
        do {
            let domainUsers = try await fetchUsersUseCase.execute()
            users = domainUsers.map { UserViewData(id: $0.id, username: $0.username, avatarURL: URL(string: $0.avatarURL)) }
        } catch {
            errorMessage = String(format: NSLocalizedString("error_message", comment: ""), error.localizedDescription)
        }
        isLoading = false
    }
}
