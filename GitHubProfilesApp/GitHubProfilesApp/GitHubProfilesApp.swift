//
//  GitHubProfilesAppApp.swift
//  GitHubProfilesApp
//
//  Created by Gerhard Reyes on 2024-11-27.
//

import SwiftUI

@main
struct GitHubProfilesApp: App {
    let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: UserListViewModel(fetchUsersUseCase: container.fetchUsersUseCase))
        }
    }
}
