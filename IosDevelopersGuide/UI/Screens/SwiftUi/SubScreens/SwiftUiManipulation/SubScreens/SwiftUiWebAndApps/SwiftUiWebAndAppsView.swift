//

// intentional: raw Color.* literals in this file are demo content that teaches
// SwiftUI concepts (e.g. what Color.green looks like) and must read literally.
//  SwiftUiHyperlinks.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import WebKit

struct SwiftUiWebAndAppsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiWebAndAppsViewModel
    
    func link() -> some View {
        return CustomSection(
            snippetTitle: "Web link",
            snippetDescription: """
            Take to a resource hosted on web using it's link.
            """,
            snippetCode: """
            Link("Google", destination: URL(string: "https://www.google.com")!)
            """,
            demoView: {
                Link("Google", destination: URL(string: "https://www.google.com")!)
            }
        )
    }
    
    func webView() -> some View {
        return CustomSection(
            snippetTitle: "Web view",
            snippetDescription: """
            Show a web view to surf web.
            """,
            snippetCode: """
            struct WebView: UIViewRepresentable {
                let url: URL

                func makeUIView(context: Context) -> WKWebView {
                    let webView = WKWebView()
                    webView.navigationDelegate = context.coordinator
                    return webView
                }

                func updateUIView(_ uiView: WKWebView, context: Context) {
                    let request = URLRequest(url: url)
                    uiView.load(request)
                }

                func makeCoordinator() -> Coordinator {
                    Coordinator()
                }

                class Coordinator: NSObject, WKNavigationDelegate {
                    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                        print("Finished loading")
                    }

                    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
                        print("Failed to load: \\(error.localizedDescription)")
                    }
                }
            }
            
            WebView(url: URL(string: "https://www.google.com")!)
                .frame(maxWidth: .infinity)
                .frame(height: 336)
            """,
            demoView: {
                WebView(url: URL(string: "https://www.google.com")!)
                    .frame(maxWidth: .infinity)
                    .frame(height: 336)
            }
        )
    }
    
    func openApp() -> some View {
        return CustomSection(
            snippetTitle: "Open app",
            snippetDescription: """
            Open another app.
            """,
            snippetCode: """
            struct OpenSettingsView: View {
                var body: some View {
                    Button(action: openSettings) {
                        Text("Open Settings")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(DesignSystem.Sizes.radiusSm)
                    }
                }

                func openSettings() {
                    // URL to open the General Settings page
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            print("Cannot open Settings.")
                        }
                    }
                }
            }
            
            OpenSettingsView()

            """,
            demoView: {
                OpenSettingsView()
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Web & apps",
            content: {
                link()
                webView()
                openApp()
            }
        )
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Finished loading")
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
}

struct OpenSettingsView: View {
    var body: some View {
        Button(action: openSettings) {
            Text("Open Settings")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(DesignSystem.Sizes.radiusSm)
        }
    }

    func openSettings() {
        // URL to open the General Settings page
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open Settings.")
            }
        }
    }
}

//#Preview {
//    SwiftUiWebView()
//}
