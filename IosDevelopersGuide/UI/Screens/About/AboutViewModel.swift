//
//  AboutViewModel.swift
//  IosDevelopersGuide
//
//  Owns the static copy for the About page. The content is data, not UI, so it
//  lives in a viewModel (constructed through Factory DI like every other screen)
//  rather than being hardcoded in the view.
//

import Foundation
import FactoryKit

@MainActor
final class AboutViewModel: ObservableObject {

    private let logger: AppLoggerProtocol

    /// High-level topic areas the app covers (mirrors the React guide's
    /// "What it covers" grid). Kept short — the full link list lives in
    /// HomeViewModel.
    let coveredAreas: [CoveredArea] = [
        CoveredArea(
            title: "Fundamentals",
            note: "iOS fundamentals, Swift language, SwiftUI & UIKit building blocks"
        ),
        CoveredArea(
            title: "UI & layout",
            note: "Page layout, dimensions, colors, the SwiftUI control catalog"
        ),
        CoveredArea(
            title: "Native features",
            note: "Camera, FaceID, microphone, Bluetooth, sensors, notifications"
        ),
        CoveredArea(
            title: "Data pipeline",
            note: "HTTP client + interceptors, local database, Result/Failure errors"
        ),
        CoveredArea(
            title: "Engineering",
            note: "Clean architecture, dependency injection, testing, environment config"
        ),
        CoveredArea(
            title: "Craft",
            note: "Logging, deployment, best practices for shipping maintainable apps"
        ),
    ]

    /// The stack snapshot shown in the "The stack" code block.
    let stackText: String = """
    UI runtime          SwiftUI (iOS 17+), UIKit interop
    Language            Swift
    Architecture        Clean architecture: Domain / Data / Core / UI
    DI                  Factory (service-locator containers, .singleton scope)
    Networking          HTTPClient + request/response interceptors
    Storage             AppDatabase + FakeAppDatabase (swappable per environment)
    Error handling      Result<T, Failure> at the data boundary
    Routing             NavigationStack + a single Router ObservableObject
    Design system       Token-driven ColorScheme (light/dark) + FontScheme
    Build               Xcode 16, file-system-synchronized groups
    """

    init(logger: AppLoggerProtocol = Container.shared.viewModelLogger()) {
        self.logger = logger
        logger.info("AboutViewModel initialized")
    }

    struct CoveredArea: Identifiable {
        let id = UUID()
        let title: String
        let note: String
    }
}
