//
//  ExceptionHandlingViewModel.swift
//  IosDevelopersGuide
//
//  Owns the static copy and the small interactive demo state for the Exception
//  handling screen. The content is data, not UI, so it lives in a viewModel
//  (constructed through Factory DI like every other screen) rather than being
//  hardcoded in the view. Mirrors `AboutViewModel`.
//

import Foundation
import FactoryKit

@MainActor
final class ExceptionHandlingViewModel: ObservableObject {

    private let logger: AppLoggerProtocol

    /// The currently selected demo failure rendered live in the "Showing
    /// errors to the user" section. Nil means "no banner". Set from the UI by
    /// tapping one of the demo buttons; cleared by the banner's dismiss.
    @Published var demoFailure: Failure?

    /// The fixed menu of demo failures — one per severity — used to drive the
    /// live `ErrorBanner` so the reader can see severity drive the tone.
    let demoOptions: [DemoOption] = [
        DemoOption(
            label: "Info (cache miss)",
            failure: CacheFailure.notFound()
        ),
        DemoOption(
            label: "Warning (network timeout)",
            failure: NetworkFailure.timeout()
        ),
        DemoOption(
            label: "Critical (server 5xx)",
            failure: ServerFailure.internalServerError()
        ),
    ]

    init(logger: AppLoggerProtocol = Container.shared.viewModelLogger()) {
        self.logger = logger
        logger.info("ExceptionHandlingViewModel initialized")
    }

    /// Sets the live demo failure (called from the demo buttons).
    func show(_ option: DemoOption) {
        demoFailure = option.failure
    }

    /// Clears the live demo failure (called by the banner's dismiss action).
    func clearDemo() {
        demoFailure = nil
    }

    /// One demo entry: a button label paired with the failure it surfaces.
    struct DemoOption: Identifiable {
        let id = UUID()
        let label: String
        let failure: Failure
    }
}
