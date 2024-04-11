//
//  SwiftUiNativeFeatures.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiNativeFeaturesView: View {
    let links: [LinkData] = [
        LinkData(title: "Camera", routePath: Router.routePaths.swiftUiCamera),
        LinkData(title: "FaceId", routePath: Router.routePaths.swiftUiFaceId),
        LinkData(title: "Microphone", routePath: Router.routePaths.swiftUiMicrophone),
        LinkData(title: "Speakers", routePath: Router.routePaths.swiftUiSpeakers),
        LinkData(title: "Bluetooth", routePath: Router.routePaths.swiftUiBluetooth),
        LinkData(title: "Wifi", routePath: Router.routePaths.swiftUiWifi),
        LinkData(title: "Compass", routePath: Router.routePaths.swiftUiCompass),
        LinkData(title: "Accelermeter", routePath: Router.routePaths.swiftUiAccelerometer),
        LinkData(title: "Proximity sensor", routePath: Router.routePaths.swiftUiProximitySensor),
        LinkData(title: "Ambient light sensor", routePath: Router.routePaths.swiftUiAmbientLightSensor),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Native features",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiNativeFeaturesView()
}
