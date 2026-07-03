//
//  SwiftUiMapView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI
import MapKit

struct SwiftUiCatalogMapView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogMapViewModel
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    ))

    func map() -> some View {
        return CustomSection(
            snippetTitle: "Map",
            snippetDescription: """
            View to show map.
            """,
            snippetCode: """
            @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            ))
            
            Map(position: $cameraPosition)
                .aspectRatio(1.0, contentMode: .fill)

            """,
            demoView: {
                Map(position: $cameraPosition)
                    .aspectRatio(1.0, contentMode: .fill)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Map",
            content: {
                map()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogMapView()
//}
