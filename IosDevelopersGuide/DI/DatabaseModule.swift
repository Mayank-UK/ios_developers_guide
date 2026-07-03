//
//  DatabaseModule.swift
//  IosDevelopersGuide
//
//  Mirrors the Android `DatabaseModule` Hilt module: provides the Core Data
//  stack entry point (`NSManagedObjectContext`), scoped as a singleton.
//

import CoreData
import FactoryKit

extension Container {
    /// Main-thread Core Data context backed by `AppDatabase`.
    var context: Factory<NSManagedObjectContext> {
        Factory(self) {
            AppDatabase.shared.context
        }
        .scope(.singleton)
    }
}
