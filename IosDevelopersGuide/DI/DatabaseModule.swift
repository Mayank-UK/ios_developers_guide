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

        Factory(self) {

            let config = AppConfiguration.shared

            if config.useFakeDatabase {

                print("🧪 Using FakeAppDatabase")

                return FakeAppDatabase(
                    scenario: .success
                ) as any DatabaseServiceProtocol

            } else {

                print("💾 Using AppDatabase")

                return AppDatabase.shared as any DatabaseServiceProtocol
            }
        }
        .scope(.singleton)
    }
}