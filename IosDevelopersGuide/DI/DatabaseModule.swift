//
//  DatabaseModule.swift
//
//  Mirrors the Android DatabaseModule.
//  Resolves the single shared local store (real or fake), then hands out narrow
//  per-feature local-data-source views of it. `USE_FAKE_DATABASE` (config files)
//  toggles the whole layer. One store instance backs every feature — a database
//  is one engine, not one per feature.
//

import FactoryKit

extension Container {
    // USE_FAKE_DATABASE variable inside config files to switch between FakeAppDatabase and AppDatabase, keep the wiring here

    /// The single shared store (real `AppDatabase` or `FakeAppDatabase`).
    /// Resolved once; the narrow factories below return views of this same instance.
    var localStore: Factory<any LocalDataStore> {
        Factory(self) {
            let config = AppConfiguration.shared
            if config.useFakeDatabase {
                return FakeAppDatabase(
                    scenario: config.dbScenario,
                    logger: self.databaseLogger()
                ) as any LocalDataStore
            } else {
                return AppDatabase.shared as any LocalDataStore
            }
        }
        .scope(.singleton)
    }

    /// Feature-narrow view over the shared store — repositories depend on this.
    var postLocalDataSource: Factory<any PostLocalDataSource> {
        Factory(self) { self.localStore() as any PostLocalDataSource }
            .scope(.singleton)
    }
}
