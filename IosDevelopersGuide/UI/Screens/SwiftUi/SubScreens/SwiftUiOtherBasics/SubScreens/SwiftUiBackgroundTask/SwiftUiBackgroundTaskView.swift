//
//  BackgroundTaskView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 23/08/24.
//

import SwiftUI
import BackgroundTasks

struct SwiftUiBackgroundTaskView: View {
    @StateObject var viewModel: SwiftUiBackgroundTaskViewModel
    @Environment(\.scenePhase) private var scenePhase
    @State private var taskIdentifier = "com.example.MyApp.refresh"

    var body: some View {
        PageScaffold(
            pageTitle: "Background task",
            content: {
                basics()
            }
        )
        
    }
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Basics",
            snippetDescription: "Run background tasks.",
            snippetCode: """
            // enable the background mode in the app settings
            
            @StateObject var viewModel: SwiftUiBackgroundTaskViewModel
            @Environment(\\.scenePhase) private var scenePhase
            @State private var taskIdentifier = "com.example.MyApp.refresh"
            
            VStack(spacing: 20) {
                Text("At the time it was not working properly due to some issue.")
                Button(action: scheduleBackgroundTask) {
                    Text("Start Background Task")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: cancelBackgroundTask) {
                    Text("Cancel Background Task")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .background {
                    scheduleBackgroundTask()
                }
            }
            
            private func scheduleBackgroundTask() {
                let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
                request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes from now

                do {
                    try BGTaskScheduler.shared.submit(request)
                    print("Successfully scheduled background task")
                } catch {
                    print("Failed to submit BGAppRefreshTaskRequest: \\(error)")
                }
            }
            
            private func cancelBackgroundTask() {
                BGTaskScheduler.shared.cancel(taskRequestWithIdentifier: taskIdentifier)
                print("Canceled background task")
            }
            """,
            demoView: {
                VStack(spacing: 20) {
                    Text("At the time it was not working properly due to some issue.")
                    Button(action: scheduleBackgroundTask) {
                        Text("Start Background Task")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: cancelBackgroundTask) {
                        Text("Cancel Background Task")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .background {
                        scheduleBackgroundTask()
                    }
                }
            }
        )
    }

    private func scheduleBackgroundTask() {
        let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes from now

        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to submit BGAppRefreshTaskRequest: \(error)")
        }
    }
    
    private func cancelBackgroundTask() {
        BGTaskScheduler.shared.cancel(taskRequestWithIdentifier: taskIdentifier)
    }
}

//#Preview {
//    BackgroundTaskView()
//}
