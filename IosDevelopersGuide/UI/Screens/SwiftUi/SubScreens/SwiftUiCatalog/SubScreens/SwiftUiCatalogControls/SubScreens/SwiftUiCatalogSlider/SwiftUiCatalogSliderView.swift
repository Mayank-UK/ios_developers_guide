//
//  SwiftUiSlider.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogSliderView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogSliderViewModel
    
    @State private var volume: Double = 50.0
    @State private var rating: Double = 50.0
    
    func slider() -> some View {
        return CustomSection(
            snippetTitle: "Slider",
            snippetDescription: """
            A control for selecting a value from a bounded linear range of values.
            """,
            snippetCode: """
            @State private var volume: Double = 50.0
            @State private var rating: Double = 50.0
            
            VStack {
                Slider(
                    value: $volume,
                    in: 0...100,
                    minimumValueLabel: Image(systemName: "speaker"),
                    maximumValueLabel: Image(systemName: "speaker.wave.3"),
                    label: {
                        Text("Volume")
                    }
                )
                Spacer().frame(height: 32)
                Slider(
                    value: $rating,
                    in: 0...10,
                    step: 1,
                    minimumValueLabel: Text("0"),
                    maximumValueLabel: Text("10"),
                    label: {
                        Text("Rating")
                    }
                )
            }
            """,
            demoView: {
                VStack {
                    Slider(
                        value: $volume,
                        in: 0...100,
                        minimumValueLabel: Image(systemName: "speaker"),
                        maximumValueLabel: Image(systemName: "speaker.wave.3"),
                        label: {
                            Text("Volume")
                        }
                    )
                    Spacer().frame(height: 32)
                    Slider(
                        value: $rating,
                        in: 0...10,
                        step: 1,
                        minimumValueLabel: Text("0"),
                        maximumValueLabel: Text("10"),
                        label: {
                            Text("Rating")
                        }
                    )
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Slider",
            content: {
                slider()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogSliderView()
//}
