//
//  SwiftUiNotification.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 29/08/24.
//

import Foundation
import SwiftUI
import UserNotifications

struct SwiftUiNotificationView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiNotificationViewModel
    
    @State private var isAuthorized = false
    @State private var notificationMessage = "Checking notification settings..."
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Basics",
            snippetDescription: """
            Show the notifications in the app. Just make sure to handle scenerios to request notifidation permissions, request again if denied, etc.
            
            Notification permissions should be registered in the info.plist of the project.
            """,
            snippetCode: """
            @State private var isAuthorized = false
            @State private var notificationMessage = "Checking notification settings..."
            
            VStack {
                if isAuthorized {
                    Button(action: {
                        scheduleNotification()
                    }) {
                        Text("Send Notification")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else {
                    Text(notificationMessage)
                        .padding()
                        .foregroundColor(.red)

                    Button(action: {
                        openAppSettings()
                    }) {
                        Text("Open Settings")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .onAppear {
                requestNotificationAuthorization { granted in
                    checkNotificationAuthorization { authorized in
                        isAuthorized = authorized
                        
                        if authorized {
                            notificationMessage = "Notifications are enabled."
                        } else {
                            notificationMessage = "Notifications are disabled. Please enable them in settings."
                        }
                    }
                }
            }
            
            func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            print("Error requesting authorization: \\(error.localizedDescription)")
                        }
                        completion(granted)
                    }
                }
            }

            func checkNotificationAuthorization(completion: @escaping (Bool) -> Void) {
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                    DispatchQueue.main.async {
                        let isAuthorized = settings.authorizationStatus == .authorized
                        if !isAuthorized {
                            print("Notification authorization is not granted.")
                        }
                        completion(isAuthorized)
                    }
                }
            }

            func scheduleNotification() {
                let content = UNMutableNotificationContent()
                content.title = "Notification Title"
                content.body = "This is the body of the notification."
                content.sound = .default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \\(error.localizedDescription)")
                    }
                }
            }

            func openAppSettings() {
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                }
            }
            """,
            demoView: {
                VStack {
                    if isAuthorized {
                        Button(action: {
                            scheduleNotification()
                        }) {
                            Text("Send Notification")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    } else {
                        Text(notificationMessage)
                            .padding()
                            .foregroundColor(.red)

                        Button(action: {
                            openAppSettings()
                        }) {
                            Text("Open Settings")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .onAppear {
                    requestNotificationAuthorization { granted in
                        checkNotificationAuthorization { authorized in
                            isAuthorized = authorized
                            
                            if authorized {
                                notificationMessage = "Notifications are enabled."
                            } else {
                                notificationMessage = "Notifications are disabled. Please enable them in settings."
                            }
                        }
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Notifications",
            content: {
                basics()
            }
        )
    }
}

func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
        DispatchQueue.main.async {
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
            completion(granted)
        }
    }
}

func checkNotificationAuthorization(completion: @escaping (Bool) -> Void) {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
        DispatchQueue.main.async {
            let isAuthorized = settings.authorizationStatus == .authorized
            if !isAuthorized {
                print("Notification authorization is not granted.")
            }
            completion(isAuthorized)
        }
    }
}

func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Notification Title"
    content.body = "This is the body of the notification."
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        }
    }
}

func openAppSettings() {
    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
    }
}

//#Preview {
//    SwiftUiNotificationView()
//}
