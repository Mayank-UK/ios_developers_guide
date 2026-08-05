//
//  ExceptionHandlingView.swift
//  IosDevelopersGuide
//
//  Teaches the app's typed error machinery end to end — why the app models
//  errors as values (Result<T, Failure>), what Failures and Exceptions are,
//  how ExceptionMapper bridges them, how the guard functions convert throwing
//  calls into Results, and how the UI surfaces them through ErrorBanner /
//  ErrorSnackbar. Mirrors the React sibling guide's exception_handling screen
//  in depth, but the copy and types are this codebase's own. Uses only the
//  Phase 1 presentational primitives (SectionWrapper / ContentGroup / TextBlock
//  / CodeBlock) and DesignSystem tokens — no hardcoded fonts or colors.
//

import SwiftUI
import FactoryKit

struct ExceptionHandlingView: View {
    @StateObject var viewModel: ExceptionHandlingViewModel
    @EnvironmentObject private var designSystem: DesignSystem

    var body: some View {
        PageScaffold(pageTitle: "Exception handling") {
            VStack(spacing: DesignSystem.Sizes.lg) {
                WhyTypedErrorsSection()
                FailuresSection()
                ExceptionsSection()
                ExceptionMapperSection()
                GuardsSection()
                ShowingErrorsSection(viewModel: viewModel)
            }
            .padding(.horizontal, DesignSystem.Sizes.md)
            .padding(.bottom, DesignSystem.Sizes.xl)
        }
    }

    // MARK: - 1. Why a typed error model

    private struct WhyTypedErrorsSection: View {
        var body: some View {
            SectionWrapper("Why a typed error model") {
                ContentGroup("Two kinds of things going wrong") {
                    TextBlock(
                        """
                        Not every failure is a bug. Throwing and crashing is the right answer when the program reaches a state its author believed was impossible — an unset force-unwrap, a missing required configuration, an invariant that no longer holds. Those are programmer errors, and an exception (or a `fatalError`) is the honest signal that the code needs fixing.
                        """
                    )
                    TextBlock(
                        """
                        But most of what an app calls a failure is not a bug — it is the world behaving normally: the device is offline, the server returned a 5xx, a JSON field is missing, the cache is empty. These are expected domain outcomes, not crashes. They should flow as values — `Result<Success, Failure>` — not as thrown exceptions, so the UI can branch on them and present each one appropriately instead of aborting the flow. The benefit is that errors become data: the call site gets a typed `Failure` it can switch over, decide a tone for, and recover from, with the happy path and the unhappy path sharing one explicit return type.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 2. Failures: the error vocabulary

    private struct FailuresSection: View {
        var body: some View {
            SectionWrapper("Failures: the error vocabulary") {
                TextBlock(
                    """
                    A `Failure` is the presentable, UI-facing shape of an error. Every concrete failure carries a user-facing `message`, a `severity`, an optional `cause` (so failures can chain), and optional `technicalDetails` for logs. They are what the data layer hands the UI inside `Result.failure(_)` — never raw exceptions, never raw `Error`.
                    """
                )

                ContentGroup("Severity drives the tone") {
                    TextBlock(
                        """
                        `FailureSeverity` has three cases — info, warning, critical — and the design system maps each to a fill/text pair through `ColorScheme.severity(_:)` and `.onSeverity(_:)`. Info is calm (cache miss, nothing loaded yet), warning is recoverable (timeout, bad request), critical needs attention (server 5xx, unknown error). `FailureSeverity` also exposes `displayName` and `iconName` so banners stay consistent.
                        """
                    )
                }

                ContentGroup("The concrete failure types") {
                    FailureRow(
                        name: "NetworkFailure",
                        detail: "Connectivity issues — no connection, timeout, host unreachable. Defaults to warning."
                    )
                    FailureRow(
                        name: "ServerFailure",
                        detail: "HTTP error responses — 4xx (warning) and 5xx (critical). Carries the status code."
                    )
                    FailureRow(
                        name: "CacheFailure",
                        detail: "Local storage outcomes — cache miss, read/write failure, corrupted data. Defaults to info."
                    )
                }
            }
        }
    }

    // MARK: - 3. Exceptions: the low-level cause

    private struct ExceptionsSection: View {
        var body: some View {
            SectionWrapper("Exceptions: the low-level cause") {
                TextBlock(
                    """
                    An `AppException` is what actually went wrong at the source — a `URLError` from URLSession, a `DecodingError` from JSONDecoder, a Core Data failure. These are precise and technical, and they are never shown to the user directly. They exist so the boundary code (the guards and the mapper) can inspect them and translate them into the right presentable `Failure`.
                    """
                )

                ContentGroup("The concrete exception types") {
                    FailureRow(
                        name: "NetworkException",
                        detail: "No connection, timeout, unreachable, connection lost. Maps to NetworkFailure."
                    )
                    FailureRow(
                        name: "ServerException",
                        detail: "HTTP status errors (400/401/404/500…). Carries the statusCode. Maps to ServerFailure."
                    )
                    FailureRow(
                        name: "DatabaseException",
                        detail: "Read / write / delete / connection failures against the local store. Maps to CacheFailure."
                    )
                    FailureRow(
                        name: "DecodingException",
                        detail: "JSON decode failures — type mismatch, missing field, corrupted payload. Maps to ServerFailure."
                    )
                    FailureRow(
                        name: "AppException (protocol)",
                        detail: "The base protocol every exception conforms to — message, cause, context. Anything unmatched maps to a critical ServerFailure."
                    )
                }
            }
        }
    }

    // MARK: - 4. Bridging the two: ExceptionMapper

    private struct ExceptionMapperSection: View {
        var body: some View {
            SectionWrapper("Bridging the two: ExceptionMapper") {
                TextBlock(
                    """
                    `ExceptionMapper` is the single place that knows how an internal `AppException` becomes a presentable `Failure`. It walks the exception's cause chain recursively (so a nested exception becomes a nested failure), then pattern-matches on the concrete exception type to produce the matching failure, assigns a severity from the status code where relevant, and rewrites the technical message into a user-friendly one. Because all of this lives in one enum, the translation rule is auditable and testable in isolation.
                    """
                )
                CodeBlock(
                    code: """
                    enum ExceptionMapper {
                        static func mapExceptionToFailure(
                            _ exception: AppException
                        ) -> Failure
                    }

                    // Convenience on Error — used by the guards.
                    extension Error {
                        func toFailure() -> Failure
                    }
                    """,
                    language: "swift"
                )
            }
        }
    }

    // MARK: - 5. The guards

    private struct GuardsSection: View {
        var body: some View {
            SectionWrapper("The guards: GuardedApiCall & SafeRepositoryCall") {
                TextBlock(
                    """
                    The two guard functions are where throwing code is converted into a `Result`. `guardedApiCall` wraps a remote call and normalizes raw Foundation errors (`URLError`, `DecodingError`) into the app's `AppException` types — it still throws, because networking is low-level. `safeRepositoryCall` wraps a repository's throwing call and catches every exception type, mapping each one through `ExceptionMapper` into a `Result.failure(Failure)`. It also exposes optional per-type fallbacks so a repository can recover from, say, a `NetworkException` by returning cached data instead of failing.
                    """
                )
                CodeBlock(
                    code: """
                    // Low-level: normalizes Foundation errors into AppException.
                    func guardedApiCall<T>(
                        _ call: @escaping () async throws -> T
                    ) async throws -> T

                    // Boundary: catches every exception and returns a Result.
                    func safeRepositoryCall<T>(
                        call: @escaping () async throws -> T,
                        onNetworkError: ((NetworkException) async -> Result<T>)? = nil,
                        onServerError: ((ServerException) async -> Result<T>)? = nil,
                        onDatabaseError: ((DatabaseException) async -> Result<T>)? = nil,
                        onDecodingError: ((DecodingException) async -> Result<T>)? = nil
                    ) async -> Result<T>
                    """,
                    language: "swift"
                )
            }
        }
    }

    // MARK: - 6. Showing errors to the user

    private struct ShowingErrorsSection: View {
        @ObservedObject var viewModel: ExceptionHandlingViewModel
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            SectionWrapper("Showing errors to the user") {
                TextBlock(
                    """
                    At the UI boundary a `Failure` becomes one of two components. `ErrorBanner` is an inline, dismissible banner pinned to the top — meant for warnings and critical errors the user needs to notice but can dismiss. `ErrorSnackbar` is a subtle, auto-dismissing chip at the bottom — meant for info-level messages that don't deserve to interrupt. Both read `failure.severity` for their tone; in this codebase that severity is surfaced through the design-system tokens `ColorScheme.severity(_:)` and `.onSeverity(_:)`, so the same failure renders consistently in light and dark.
                    """
                )

                ContentGroup("Try it") {
                    TextBlock(
                        "Tap an option to render it as a live ErrorBanner. The banner auto-dismisses after a few seconds; swipe it away or use the dismiss button."
                    )

                    VStack(alignment: .leading, spacing: DesignSystem.Sizes.sm) {
                        ForEach(viewModel.demoOptions) { option in
                            Button {
                                viewModel.show(option)
                            } label: {
                                Text(option.label)
                                    .font(designSystem.types.bodyMedium)
                                    .foregroundColor(designSystem.colorScheme.onPrimary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, DesignSystem.Sizes.sm)
                                    .padding(.horizontal, DesignSystem.Sizes.md)
                                    .background(designSystem.colorScheme.primary)
                                    .cornerRadius(DesignSystem.Sizes.radiusSm)
                            }
                        }
                    }

                    // Bounded live preview of ErrorBanner so it doesn't push
                    // the page layout. The banner is an overlay-style view
                    // (VStack with a Spacer), so we constrain its height.
                    ZStack(alignment: .top) {
                        if let failure = viewModel.demoFailure {
                            ErrorBanner(
                                failure: failure,
                                onDismiss: { viewModel.clearDemo() }
                            )
                            .frame(height: 72, alignment: .top)
                            .clipped()
                        } else {
                            Text("No banner selected.")
                                .font(designSystem.types.bodyMedium)
                                .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.6))
                                .frame(height: 72, alignment: .center)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, DesignSystem.Sizes.xs)
                }
            }
        }
    }

    // MARK: - Shared row

    /// A single name + one-liner row used by the Failures and Exceptions lists.
    private struct FailureRow: View {
        @EnvironmentObject private var designSystem: DesignSystem
        let name: String
        let detail: String

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.xxs) {
                Text(name)
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .foregroundColor(designSystem.colorScheme.onSurface)
                Text(detail)
                    .font(designSystem.types.bodyMedium)
                    .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.7))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, DesignSystem.Sizes.xxs)
        }
    }
}

#Preview {
    NavigationStack {
        ExceptionHandlingView(viewModel: Container.shared.exceptionHandlingViewModel())
    }
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .environmentObject(ThemeManager())
    .environmentObject(DrawerState())
}
