//
//  Deployment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DeploymentView: View {
    // inject the viewModel from route
    @StateObject var viewModel: DeploymentViewModel
    
    func testDeployment() -> some View {
        return CustomSection(
            snippetTitle: "Test deployment",
            snippetDescription: """
            To test your app on devices before releasing it to the public. This can be done using different methods like TestFlight, Ad Hoc distribution, or local device deployment.
            
            Development Builds
            
            1) Set Up Your Project:
            - Ensure your Xcode project is configured for development, including correct signing and capabilities.
            - Use the Debug configuration for development builds.
            
            2) Code Signing:
            - Use a Development Certificate and Provisioning Profile.
            - Xcode can manage these automatically or you can configure them manually.
            
            3) Deploy to a Physical Device:
            - Connect your iOS device to your Mac.
            - Select your device as the target in Xcode.
            - Click the Run button to install the app directly on your device.
            
            
            Ad Hoc Distribution
            1) Create an Ad Hoc Provisioning Profile:
            - In the Apple Developer website, create a provisioning profile that includes the UDIDs of the devices you want to test on.
            
            2) Build and Archive:
            - Archive your app using Xcode with the Ad Hoc distribution method.
            
            3) Export the IPA File:
            - In the Organizer window, select your archive and choose Distribute App > Ad Hoc.
            - Export the IPA file.
            
            4) Distribute the IPA:
            - Distribute the IPA file to testers, who can install it using tools like Apple Configurator or third-party services like Diawi.
            
            
            TestFlight
            1) Upload Your App:
            - Archive your app in Xcode and upload it to App Store Connect.
            
            2) Configure TestFlight:
            - In App Store Connect, navigate to My Apps > TestFlight.
            - Add internal testers (your team) or external testers (users outside your organization) to test your app.
            
            3) Distribute for Testing:
            - Testers receive an email invitation to test the app via the TestFlight app.
            """
        )
    }
    
    func prodDeployment() -> some View {
        return CustomSection(
            snippetTitle: "Prod deployment",
            snippetDescription: """
            To release your app to the public via the App Store, making it available to all users.

            1) Finalize Your App
            i) Set Up Your Project for Release:
                - Ensure your Xcode project is configured for release, including correct signing and capabilities.
                - Use the Release configuration for production builds.
            
            ii) Code Signing:
                - Use a Distribution Certificate and Provisioning Profile.
                - Xcode can manage these automatically or you can configure them manually.
            
            
            2) Build and Archive
            i) Create an Archive:
                - Select Product > Archive in Xcode.
            
            ii) Validate the Archive:
                - Use the Organizer window to validate your archive to ensure there are no issues before submission.
            
            3) Submit to App Store
            i) Upload Your App:

                - In the Organizer window, select your archive and choose Distribute App > App Store Connect.
                - Follow the prompts to upload your app to App Store Connect.
                - Configure App Store Connect Settings:

            ii) Log in to App Store Connect.
                - Go to My Apps and select your app.
                - Fill out all required metadata, including app description, screenshots, pricing, and availability.
            
            iii) Submit for Review:
                - Under the App Store tab, select the build you uploaded and complete the submission process.
                - Click Submit for Review.
            
            iV) Monitor Review Status:
                - Check the status of your app’s review and address any issues or feedback from the review team.
            
            4) Release Your App
            i) Release to the Public:
                - Once approved, your app will be available on the App Store.
                - You can choose to release it immediately or set a release date.
            
            ii) Post-Launch:
                - Monitor user feedback and reviews.
                - Prepare and submit updates as needed.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Deployment",
            content: {
                testDeployment()
                prodDeployment()
            }
        )
    }
}


//#Preview {
//    DeploymentView()
//}
