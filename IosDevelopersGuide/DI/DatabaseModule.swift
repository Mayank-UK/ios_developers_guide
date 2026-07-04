//
//  DatabaseModule.swift
//  IosDevelopersGuide
//
//  Mirrors the Android DatabaseModule.
//  Provides either the real CoreData database or the fake database.
//

import FactoryKit

extension Container {

    var database: Factory<any DatabaseServiceProtocol> {
        /// Scoped and singleton — only one single instance for all injections
        Factory(self) {
            let config = AppConfiguration.shared
            if config.useFakeDatabase {
                return FakeAppDatabase(
                    scenario: .success
                ) as any DatabaseServiceProtocol
            } else {
                return AppDatabase.shared as any DatabaseServiceProtocol
            }
        }
        .scope(.singleton)
    }
}
