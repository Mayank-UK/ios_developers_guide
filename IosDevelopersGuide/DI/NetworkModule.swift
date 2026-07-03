//
//  NetworkModule.swift
//  IosDevelopersGuide
//
//  Mirrors the Android `NetworkModule` / `FlavorNetworkModule` Hilt module:
//  provides the remote networking dependency, scoped as a singleton.
//

import FactoryKit

extension Container {
    /// Remote API client. `any` keeps the protocol type resolvable through Factory.
    var apiService: Factory<any APIServiceProtocol> {
        Factory(self) {
            // Use fake service for testing if flag is set
            if Self.isTestingMode {
                print("🧪 [DI] Using FakeApiService for testing")
                return FakeApiService(scenario: .networkError) as any APIServiceProtocol
            } else {
                print("🌐 [DI] Using real APIService")
                return APIService() as any APIServiceProtocol
            }
        }
        .scope(.singleton)
    }

    /// Testing mode flag - set to true to use fake services
    static var isTestingMode = false
}
