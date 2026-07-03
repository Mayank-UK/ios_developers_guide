//
//  SwiftUiNotificationView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI
import UserNotifications

struct SwiftUiCatalogNotificationView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogNotificationViewModel
    
    @State private var permissionRequested = false
    
    func notification() -> some View {
        func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Notification permission granted!")
                    scheduleLocalNotification()
                } else if let error = error {
                    print("Error requesting permission: \(error.localizedDescription)")
                }
            }
        }

        func scheduleLocalNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Important Alert"
            content.body = "Don't forget to wear sunscreen!"
            content.sound = .default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully!")
                }
            }
        }
        
        return CustomSection(
            snippetTitle: "Notification",
            snippetDescription: """
            Show a notification to a user.
            """,
            snippetCode: """
            @State private var permissionRequested = false
            
            func requestNotificationPermission() {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Notification permission granted!")
                        scheduleLocalNotification()
                    } else if let error = error {
                        print("Error requesting permission: \\(error.localizedDescription)")
                    }
                }
            }

            func scheduleLocalNotification() {
                let content = UNMutableNotificationContent()
                content.title = "Important Alert"
                content.body = "Don't forget to wear sunscreen!"
                content.sound = .default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \\(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully!")
                    }
                }
            }
            
            Button(action: {
                 requestNotificationPermission()
            }) {
                Text("Request notification permission")
            }
            """,
            demoView: {
                Button(action: {
                     requestNotificationPermission()
                }) {
                    Text("Request notification permission")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Notification",
            content: {
                notification()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogNotificationView()
//}
