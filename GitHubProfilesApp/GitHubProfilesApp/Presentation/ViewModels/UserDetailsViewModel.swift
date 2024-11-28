//
//  UserDetailsViewModel.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import Foundation

@MainActor
class UserDetailsViewModel: ObservableObject {
    @Published var userDetails: UserDetailsViewData?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchUserDetailsUseCase: FetchUserDetailsUseCase
    
    init(fetchUserDetailsUseCase: FetchUserDetailsUseCase) {
        self.fetchUserDetailsUseCase = fetchUserDetailsUseCase
    }

    func loadUserDetails(username: String) async {
        isLoading = true
        do {
            let domainUserDetails = try await fetchUserDetailsUseCase.execute(username: username)
            userDetails = UserDetailsViewData(
                username: domainUserDetails.username,
                avatarURL: URL(string: domainUserDetails.avatarURL),
                bio: domainUserDetails.bio ?? "",
                publicRepos: String(domainUserDetails.publicRepos)
            )
        } catch {
            errorMessage = String(format: NSLocalizedString("error_message", comment: ""), error.localizedDescription)
        }
        isLoading = false
    }
}
