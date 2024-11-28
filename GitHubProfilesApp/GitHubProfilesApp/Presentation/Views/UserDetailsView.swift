//
//  UserDetailsView.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import SwiftUI

struct UserDetailsView: View {
    let username: String
    @StateObject var viewModel: UserDetailsViewModel
    
    var body: some View {
        ZStack {
            // Background Color
            Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)

            // Content
            VStack(spacing: 20) {
                if let details = viewModel.userDetails {
                    // Profile Picture
                    AsyncImage(url: details.avatarURL) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.blue, lineWidth: 3)
                    )
                    .shadow(radius: 5)
                    
                    // Username
                    Text(details.username)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    // Bio
                    Text(details.bio)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Public Repositories
                    HStack {
                        Image(systemName: "folder")
                            .foregroundColor(.blue)
                        Text("Public Repositories: \(details.publicRepos)")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    .padding(.top, 10)

                    Spacer()
                } else if viewModel.isLoading {
                    // Loading State
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                } else {
                    // Error State
                    Text(viewModel.errorMessage ?? "Error loading details")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.red)
                }
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.loadUserDetails(username: username)
                }
            }
        }
    }
}


// MARK: - Preview
struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserDetailsView(
                username: "octocat",
                viewModel: UserDetailsViewModel(
                    fetchUserDetailsUseCase: MockFetchUserDetailsUseCase()
                )
            )
            .preferredColorScheme(.light) // Light mode
            
            UserDetailsView(
                username: "octocat",
                viewModel: UserDetailsViewModel(
                    fetchUserDetailsUseCase: MockFetchUserDetailsUseCase()
                )
            )
            .preferredColorScheme(.dark) // Dark mode
        }
    }
}

// MARK: - Mock Use Case for Preview
class MockFetchUserDetailsUseCase: FetchUserDetailsUseCase {
    func execute(username: String) async throws -> UserDetails {
        return UserDetails(
            id: 1,
            username: "octocat",
            avatarURL: "https://github.com/images/error/octocat_happy.gif",
            bio: "A passionate GitHub mascot!",
            publicRepos: 42
        )
    }
}
