# GitHub Profiles App

GitHub Profiles App is a Swift-based iOS application that allows users to explore GitHub profiles. It features a user interface built using **SwiftUI** and incorporates modern software development practices such as **MVVM architecture**, **Dependency Injection**, and **Clean Architecture**.

---

## Features

- **User List**: Displays a list of GitHub users with their avatars and usernames.
- **Profile Details**: View detailed information about a GitHub user, including:
  - Username
  - Profile picture
  - Bio
  - Number of public repositories

---

## Technologies Used

- **Swift 5**: The primary programming language for iOS development.
- **SwiftUI**: For building a declarative and reactive user interface.
- **Combine Framework**: For handling asynchronous operations and data binding in the MVVM architecture.
- **Dependency Injection**: To decouple components and make the app more modular and testable.
- **GitHub API**: Fetches real-time user data using RESTful API calls.

---

## Project Architecture

This project follows **Clean Architecture** principles to ensure modularity and scalability. Below is an overview of the architecture layers:

### **1. Presentation Layer**
- **SwiftUI Views**:
  - `UserListView`: Displays a list of GitHub users.
  - `UserDetailsView`: Shows detailed information about a selected user.
- **ViewModels**:
  - `UserListViewModel`
  - `UserDetailsViewModel`

### **2. Domain Layer**
- **Use Cases**:
  - `FetchUsersUseCase`
  - `FetchUserDetailsUseCase`

### **3. Data Layer**
- **Repositories**:
  - `UserRepository`: Protocol defining data operations.
  - `UserRepositoryImpl`: Concrete implementation for accessing user data.
- **API Layer**:
  - `GitHubApiService`: Handles RESTful API calls using `URLSession`.
