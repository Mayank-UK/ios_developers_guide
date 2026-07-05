//
//  DevEnvironmentView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI

struct DevEnvironmentView: View {
    // inject the viewModel from route
    @StateObject var viewModel: DevEnvironmentViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Environment & Build Configuration",
            snippetDescription: """
            The app supports three build environments — Development, Staging and Production — each backed by its own Xcode scheme and an Info.plist configuration. At launch, AppConfiguration (a singleton) reads environment values from the app's Info dictionary and validates them.

            Key Info.plist keys consumed by AppConfiguration:
            • ENVIRONMENT_NAME — "Development" | "Staging" | "Production"
            • API_BASE_URL — the base URL for the network layer
            • USE_FAKE_API / USE_FAKE_DATABASE — toggles that swap the real implementations for FakeApiService / FakeAppDatabase, so the app can run fully offline during development.

            Production is guarded: AppConfiguration.validate() fails fast (fatalError) if Production is configured with a fake API or database, preventing accidental fake-data shipping.
            """,
            snippetCode: """
            enum AppEnvironment: String {
                case development = "Development"
                case staging     = "Staging"
                case production  = "Production"
            }

            final class AppConfiguration {
                static let shared = AppConfiguration()

                let environment: AppEnvironment
                let apiBaseURL: String
                let useFakeAPI: Bool
                let useFakeDatabase: Bool

                private init() {
                    let info = Bundle.main.infoDictionary ?? [:]
                    environment = AppEnvironment(
                        rawValue: info["ENVIRONMENT_NAME"] as? String ?? "Development"
                    ) ?? .development
                    apiBaseURL = info["API_BASE_URL"] as? String ?? ""
                    useFakeAPI = (info["USE_FAKE_API"] as? String)?.uppercased() == "YES"
                    useFakeDatabase = (info["USE_FAKE_DATABASE"] as? String)?.uppercased() == "YES"
                    validate()
                }

                private func validate() {
                    guard !apiBaseURL.isEmpty else { fatalError("API_BASE_URL is missing") }
                    if environment == .production, useFakeAPI || useFakeDatabase {
                        fatalError("Production cannot use fake services")
                    }
                }
            }

            // Switch the whole app to offline fakes by flipping one Info.plist flag:
            // USE_FAKE_API = YES  →  FakeApiService(scenario: .success)
            """
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Environment configuration",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    TempView()
//}
