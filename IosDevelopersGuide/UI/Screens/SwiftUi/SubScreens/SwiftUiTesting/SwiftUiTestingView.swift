//
//  SwiftUiTesting.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiTestingView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiTestingViewModel
    
    func unitTesting() -> some View {
        return CustomSection(
            snippetTitle: "Unit testing",
            snippetDescription: """
            Unit tests verify individual components (functions, methods, or properties) of your code in isolation.
            In SwiftUI, you can write unit tests for:
            View models (if you follow MVVM architecture).
            Custom utility functions.
            Data processing logic.
            Use XCTest framework for writing unit tests.
            """,
            snippetCode: """
            class MyViewModel {
                func calculateSum(a: Int, b: Int) -> Int {
                    return a + b
                }
            }

            class MyViewModelTests: XCTestCase {
                func testCalculateSum() {
                    let viewModel = MyViewModel()
                    let result = viewModel.calculateSum(a: 3, b: 5)
                    XCTAssertEqual(result, 8)
                }
            }
            """
        )
    }
    
    func uiTesting() -> some View {
        return CustomSection(
            snippetTitle: "UI testing",
            snippetDescription: """
            UI tests verify the behavior of your app’s user interface.
            In SwiftUI, UI tests ensure that views are correctly displayed, interactable, and respond as expected.
            Use XCTest framework for writing UI tests.
            """,
            snippetCode: """
            struct ContentView: View {
                var body: some View {
                    Text("Hello, SwiftUI!")
                }
            }

            class ContentViewUITests: XCTestCase {
                func testHelloTextExists() {
                    let app = XCUIApplication()
                    app.launch()

                    let helloText = app.staticTexts["Hello, SwiftUI!"]
                    XCTAssertTrue(helloText.exists)
                }
            }
            """
        )
    }
    
    func snapshotTesting() -> some View {
        return CustomSection(
            snippetTitle: "Snapshot testing",
            snippetDescription: """
            Snapshot tests capture screenshots of your views and compare them against reference images.
            Useful for ensuring consistent UI appearance across different devices and iOS versions.
            Use tools like SnapshotTesting or FBSnapshotTestCase.
            """
        )
    }
    
    func accessibilityTesting() -> some View {
        return CustomSection(
            snippetTitle: "Accessibility testing",
            snippetDescription: """
            Verify that your app is accessible to users with disabilities.
            Use VoiceOver and other accessibility tools during manual testing.
            Test dynamic type, contrast, and focus order.
            """
        )
    }
    
    func mockingAndDependencyInjection() -> some View {
        return CustomSection(
            snippetTitle: "Mocking and dependency injection",
            snippetDescription: """
            Use mocks and stubs to isolate dependencies (e.g., network requests, data sources) during testing.
            Dependency injection helps replace real dependencies with mock objects for testing.
            """
        )
    }
    
    func continuousIntegration() -> some View {
        return CustomSection(
            snippetTitle: "Continuous Integration (CI)",
            snippetDescription: """
            Set up CI pipelines to automatically run tests on every code commit.
            Use services like GitHub Actions, Bitrise, or Jenkins.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Testing",
            content: {
                unitTesting()
                uiTesting()
                snapshotTesting()
                accessibilityTesting()
                mockingAndDependencyInjection()
                continuousIntegration()
            }
        )
    }
}

//#Preview {
//    SwiftUiTestingView()
//}
