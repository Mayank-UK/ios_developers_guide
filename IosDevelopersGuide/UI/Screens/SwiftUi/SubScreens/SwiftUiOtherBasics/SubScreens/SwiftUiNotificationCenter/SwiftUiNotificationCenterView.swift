//
//  NotificationCenterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 23/08/24.
//

import SwiftUI
import UIKit

struct SwiftUiNotificationCenterView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiNotificationCenterViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Basics",
            snippetDescription: "Handle system wide notifications.",
            snippetCode: """
            struct BatteryStatusView: View {
                @State private var batteryLevel: Float = UIDevice.current.batteryLevel
                @State private var batteryState: UIDevice.BatteryState = UIDevice.current.batteryState

                var body: some View {
                    VStack {
                        Text("Battery Level: \\(Int(batteryLevel * 100))%")
                        Text("Battery State: \\(batteryStateDescription)")
                    }
                    .onAppear {
                        NotificationCenter.default.addObserver(
                            forName: UIDevice.batteryStateDidChangeNotification,
                            object: nil,
                            queue: .main
                        ) { _ in
                            self.batteryState = UIDevice.current.batteryState
                            self.batteryLevel = UIDevice.current.batteryLevel
                        }
                    }
                    .onDisappear {
                        NotificationCenter.default.removeObserver(self, name: UIDevice.batteryStateDidChangeNotification, object: nil)
                    }
                }

                private var batteryStateDescription: String {
                    switch batteryState {
                    case .unknown: return "Unknown"
                    case .unplugged: return "Unplugged"
                    case .charging: return "Charging"
                    case .full: return "Full"
                    @unknown default: return "Unknown"
                    }
                }
            }
            
            BatteryStatusView()
            """,
            demoView: {
                Text("There is no direct equavalent of broadcast receiver in ios. But notification center is closest thing to it.")
                
                BatteryStatusView()
            }
        );
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Notification center",
            content: {
                basics()
            }
        )
    }
}

struct BatteryStatusView: View {
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var batteryState: UIDevice.BatteryState = UIDevice.current.batteryState

    var body: some View {
        VStack {
            Text("Battery Level: \(Int(batteryLevel * 100))%")
            Text("Battery State: \(batteryStateDescription)")
        }
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIDevice.batteryStateDidChangeNotification,
                object: nil,
                queue: .main
            ) { _ in
                self.batteryState = UIDevice.current.batteryState
                self.batteryLevel = UIDevice.current.batteryLevel
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: UIDevice.batteryStateDidChangeNotification, object: nil)
        }
    }

    private var batteryStateDescription: String {
        switch batteryState {
        case .unknown: return "Unknown"
        case .unplugged: return "Unplugged"
        case .charging: return "Charging"
        case .full: return "Full"
        @unknown default: return "Unknown"
        }
    }
}

//#Preview {
//    NotificationCenterView()
//}
