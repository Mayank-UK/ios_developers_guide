//
//  IosFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//
//  Orientation to iOS as a platform — what it is, how you build for it, and
//  why a new iOS developer should care. Mirrors the depth and structure of
//  ArchitectureView/AboutView: SectionWrapper → ContentGroup → TextBlock /
//  CodeBlock, all themed through `@EnvironmentObject DesignSystem`.
//

import SwiftUI
import FactoryKit

struct IosFundamentalsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: IosFundamentalsViewModel

    var body: some View {
        PageScaffold(pageTitle: "iOS important concepts") {
            VStack(spacing: DesignSystem.Sizes.lg) {
                WhatIOSIsSection()
                ImportantConceptsSection()
                InstallationAndSetupSection()
                DevelopmentSection()
            }
            .padding(.horizontal, DesignSystem.Sizes.md)
            .padding(.bottom, DesignSystem.Sizes.xl)
        }
    }

    // MARK: - 1. What iOS is, as a platform

    private struct WhatIOSIsSection: View {
        var body: some View {
            SectionWrapper("What iOS is, and why this guide starts here") {
                ContentGroup("A mobile OS, a set of frameworks, and a way to ship") {
                    TextBlock(
                        """
                        iOS is Apple's mobile operating system — the software that runs the iPhone and iPod Touch (and, until iPadOS split off in 2019, the iPad too). To build for it you are really learning three things at once: the Swift language, the system frameworks that expose what the hardware can do (camera, GPS, bluetooth, notifications, multitasking), and Xcode, the IDE that compiles your code, runs the Simulator, and ships your app to the App Store. The rest of this guide digs into each of those in turn; this screen is the map.
                        """
                    )
                }
                ContentGroup("UIKit vs SwiftUI — the split you will keep hearing about") {
                    TextBlock(
                        """
                        iOS apps draw their UI with one of two Apple frameworks. UIKit is the older, imperative toolkit — objects you configure and wire up by hand, descended from the original 2007 SDK. SwiftUI is the modern, declarative one — you describe what the UI should look like for a given state and let the system render it. SwiftUI is where Apple's investment is going and what new code in this guide (and most new apps) is written in, but UIKit is not going away: many mature features and third-party libraries still expect it, and the two interoperate. Expect to read SwiftUI fluently and at least recognise UIKit.
                        """
                    )
                }
                ContentGroup("The app lifecycle, in one breath") {
                    TextBlock(
                        """
                        An iOS app is launched by the system, handed a process and a window, notified of lifecycle events (moving to background, returning to foreground, receiving a memory warning), and eventually terminated. Your code hooks those events through an app-level entry point (`@main`) and a scene that builds the root view. The system, not you, decides when the app is suspended or killed to reclaim resources — so you persist user data eagerly and restore state on launch rather than counting on staying alive.
                        """
                    )
                    CodeBlock(
                        code: """
                        // The @main entry point of a SwiftUI app — the system calls this on launch.
                        @main
                        struct IosDevelopersGuideApp: App {
                            var body: some Scene {
                                WindowGroup {
                                    RootView()   // builds the navigation stack + home grid
                                }
                            }
                        }
                        """,
                        language: "swift"
                    )
                }
            }
        }
    }

    // MARK: - 2. Important concepts

    private struct ImportantConceptsSection: View {
        var body: some View {
            SectionWrapper("Important concepts") {
                TextBlock(
                    """
                    iOS is the second most popular mobile operating system in the world after Android, and the platform's shape drives how you write apps for it. Below is the surface area a new iOS developer will keep bumping into — the things Apple gives you for free so you can focus on your own feature.
                    """
                )
                ContentGroup("What the platform brings") {
                    TextBlock(
                        """
                        • Multitasking — apps run in the foreground and are suspended to the background under system control, which is why you must save state promptly.
                        • A simple, consistent UI — the system's design language (now in SwiftUI) is opinionated, so your app feels native when you follow it.
                        • Notifications — local and push, used to re-engage the user when your app is not in the foreground.
                        • Hardware access — camera, bluetooth, sensors, and more, each behind a permission prompt the user must grant.
                        • Services — Map, GPS, iCloud, and the wider Apple ecosystem, exposed as frameworks you opt into.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 3. Installation & setup

    private struct InstallationAndSetupSection: View {
        var body: some View {
            SectionWrapper("Installation & setup") {
                ContentGroup("Xcode is the whole toolchain") {
                    TextBlock(
                        """
                        There is essentially one step: install Xcode from the Mac App Store. That single download includes the Swift compiler, the iOS SDKs, the Simulator, Interface Builder, and the tools for profiling and submitting to the App Store. There is no separate language runtime, no separate SDK, and no separate device driver to chase down — Xcode is the toolchain. Refer to Apple's current installation and setup guide for any version-specific detail; the basics do not change release to release, but the exact buttons sometimes do.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 4. Development

    private struct DevelopmentSection: View {
        var body: some View {
            SectionWrapper("Development") {
                ContentGroup("Two languages, one IDE, one recommendation") {
                    TextBlock(
                        """
                        iOS apps are written in one of two languages. Objective-C is the legacy language — the "C" line — and still powers large parts of older Apple frameworks and many existing codebases. Swift is the modern language, the one Apple actively develops and the one every new project should start in. This guide, and almost everything you read written about iOS in the last several years, assumes Swift. All development for Apple devices — iPhone, iPad, Mac, Apple Watch, Apple Vision Pro — happens inside Xcode, which is why getting comfortable in that one IDE pays back across the whole ecosystem.
                        """
                    )
                    CodeBlock(
                        code: """
                        // Swift — the recommended, modern path
                        let greeting = "Hello, iOS"
                        print(greeting)

                        // Objective-C — the legacy path, still interopable with Swift
                        // NSString *greeting = @"Hello, iOS";
                        // NSLog(@"%@", greeting);
                        """,
                        language: "swift"
                    )
                }
            }
        }
    }
}

#Preview {
    IosFundamentalsView(
        viewModel: Container.shared.iosFundamentalsViewModel()
    )
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .environmentObject(ThemeManager())
    .environmentObject(DrawerState())
}
