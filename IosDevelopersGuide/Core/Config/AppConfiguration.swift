//
//  AppConfiguration.swift
//  IosDevelopersGuide
//

import Foundation

enum AppEnvironment: String {
    case development = "Development"
    case staging = "Staging"
    case production = "Production"
}

final class AppConfiguration {

    static let shared = AppConfiguration()

    let environment: AppEnvironment
    let apiBaseURL: String
    let useFakeAPI: Bool
    let useFakeDatabase: Bool

    let appVersion: String
    let buildNumber: String
    let isDebug: Bool

    private init() {
        print(Bundle.main.infoDictionary);

        let info = Bundle.main.infoDictionary ?? [:]

        let environmentName =
            info["ENVIRONMENT_NAME"] as? String ?? "Development"

        environment =
            AppEnvironment(rawValue: environmentName) ?? .development

        apiBaseURL =
            info["API_BASE_URL"] as? String ?? ""

        useFakeAPI =
            (info["USE_FAKE_API"] as? String)?
                .uppercased() == "YES"

        useFakeDatabase =
            (info["USE_FAKE_DATABASE"] as? String)?
                .uppercased() == "YES"

        appVersion =
            info["CFBundleShortVersionString"] as? String ?? ""

        buildNumber =
            info["CFBundleVersion"] as? String ?? ""

        #if DEBUG
        isDebug = true
        #else
        isDebug = false
        #endif

        validate()

        print("""
        -----------------------------
        Environment   : \(environment.rawValue)
        API URL       : \(apiBaseURL)
        Fake API      : \(useFakeAPI)
        Fake Database : \(useFakeDatabase)
        Version       : \(appVersion)
        Build         : \(buildNumber)
        -----------------------------
        """)
    }

    private func validate() {

        guard !apiBaseURL.isEmpty else {
            fatalError("API_BASE_URL is missing")
        }

        if environment == .production {

            if useFakeAPI {
                fatalError("Production cannot use fake API.")
            }

            if useFakeDatabase {
                fatalError("Production cannot use fake database.")
            }
        }
    }
}
