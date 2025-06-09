# 🚀 Skybound iOS App

A simple iOS application built with **SwiftUI**, **GraphQL (Apollo iOS 1.22.0)**, and **Clean Architecture**. The app allows users to log in, view a paginated list of rocket launches, see detailed information, and securely log out using token storage in the **Keychain**.

---

## 🛠 Features

- ✅ Login & Logout using token authentication
- 🔒 Token securely stored with Keychain
- 🚀 Paginated list of rocket launches
- 📄 Launch details on item tap
- 🧼 Clean Architecture (Presentation, Domain, Data layers)
- ⚙️ Apollo GraphQL client (v1.22.0)
- 📱 Built with SwiftUI and Combine

---

## 🧱 Architecture

This project follows a **Clean Architecture** approach with clear separation of concerns:

```
Project Root
│
├── Presentation      // SwiftUI views, view models
├── Domain            // Use cases, models
├── Data              // Repositories, GraphQL services, Data Source
└── Core              // DI, Helpers, Network, Extensions, AppState
```

---

## 🔐 Token Management

- User token is securely saved using **KeychainAccess**.
- Token is used for authenticated GraphQL API calls.
- On logout, the token is removed from the keychain.

---

## 📡 GraphQL (Apollo 1.22.0)

- Integrated using Apollo iOS
- Queries include:
  - `LoginQuery`
  - `LaunchesQuery` (with pagination)
  - `LaunchDetailsQuery`
- GraphQL schema is managed with code generation (`apollo-codegen`)

---

## 🚶‍♂️ User Flow

1. **Login**: Enter credentials to authenticate.
2. **Launch List**: View paginated list of launches.
3. **Launch Details**: Tap to view more information.
4. **Logout**: Securely clear session and return to login.

---

## 🚀 Getting Started

### Prerequisites

- Xcode 15+
- Swift 5.9+
- Swift Package Manager

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/rocket-launches-ios.git
   ```

2. Install Apollo Globally:
   ```bash
   npm install -g apollo
   ```

3. Open the workspace:
   ```bash
   open RocketLaunches.xcworkspace
   ```

4. Run the app on a simulator or device.

---

## 🔧 Tools & Libraries

- **SwiftUI** – Modern UI framework
- **Apollo iOS (1.22.0)** – GraphQL client
- **KeychainAccess** – Secure token storage
- **Combine** – Reactive programming
- **Clean Architecture** – Scalable code organization

---
