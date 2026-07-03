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
            APIService() as any APIServiceProtocol
        }
        .scope(.singleton)
    }
}
