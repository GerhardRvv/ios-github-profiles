//
//  UserListView.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: UserListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(
                    destination: UserDetailsView(
                        username: user.username,
                        viewModel: UserDetailsViewModel(fetchUserDetailsUseCase: DependencyContainer().fetchUserDetailsUseCase)
                    )
                ) {
                    HStack {
                        AsyncImage(url: user.avatarURL) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(user.username)
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.loadUsers()
                }
            }
            .navigationTitle(
                String(format: NSLocalizedString("list_title", comment: ""))
            )
        }
    }
}

// MARK: - Preview
struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = UserListViewModel(fetchUsersUseCase: MockFetchUsersUseCase())
        return UserListView(viewModel: mockViewModel)
            .onAppear {
                Task {
                    await mockViewModel.loadUsers()
                }
            }
    }
}

// MARK: - Mock Use Case for Preview
class MockFetchUsersUseCase: FetchUsersUseCase {
    func execute() async throws -> [User] {
        return [
            User(id: 1, username: "octocat", avatarURL: "https://github.com/images/error/octocat_happy.gif"),
            User(id: 2, username: "testuser", avatarURL: "https://github.com/images/error/octocat_sad.gif")
        ]
    }
}
