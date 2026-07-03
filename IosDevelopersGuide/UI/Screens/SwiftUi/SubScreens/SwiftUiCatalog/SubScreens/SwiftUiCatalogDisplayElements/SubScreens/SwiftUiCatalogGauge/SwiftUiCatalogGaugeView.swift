//
//  SwiftUiGaugeView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogGaugeView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogGaugeViewModel
    
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 100.0

    func gauge() -> some View {
        return CustomSection(
            snippetTitle: "Gauge",
            snippetDescription: """
            A view that shows a value within a range.
            """,
            snippetCode: """
            @State private var current = 67.0
            @State private var minValue = 0.0
            @State private var maxValue = 100.0
            
            VStack(alignment: .leading) {
                Gauge(value: current, in: minValue...maxValue) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                } currentValueLabel: {
                    Text("\\(current)")
                        .foregroundColor(Color.green)
                } minimumValueLabel: {
                    Text("\\(minValue)")
                        .foregroundColor(Color.green)
                } maximumValueLabel: {
                    Text("\\(maxValue)")
                        .foregroundColor(Color.red)
                }
                    .gaugeStyle(.accessoryCircular)
                Spacer().frame(height: 32)
                Gauge(value: current, in: minValue...maxValue) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                } currentValueLabel: {
                    Text("\\(current)")
                        .foregroundColor(Color.green)
                } minimumValueLabel: {
                    Text("\\(minValue)")
                        .foregroundColor(Color.green)
                } maximumValueLabel: {
                    Text("\\(maxValue)")
                        .foregroundColor(Color.red)
                }
                    .gaugeStyle(.accessoryLinear)
                Spacer().frame(height: 32)
                Gauge(value: current, in: minValue...maxValue) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                } currentValueLabel: {
                    Text("\\(current)")
                        .foregroundColor(Color.green)
                } minimumValueLabel: {
                    Text("\\(minValue)")
                        .foregroundColor(Color.green)
                } maximumValueLabel: {
                    Text("\\(maxValue)")
                        .foregroundColor(Color.red)
                }
                    .gaugeStyle(.automatic)
            }
            """,
            demoView: {
                VStack(alignment: .leading) {
                    Gauge(value: current, in: minValue...maxValue) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    } currentValueLabel: {
                        Text("\(current)")
                            .foregroundColor(Color.green)
                    } minimumValueLabel: {
                        Text("\(minValue)")
                            .foregroundColor(Color.green)
                    } maximumValueLabel: {
                        Text("\(maxValue)")
                            .foregroundColor(Color.red)
                    }
                        .gaugeStyle(.accessoryCircular)
                    Spacer().frame(height: 32)
                    Gauge(value: current, in: minValue...maxValue) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    } currentValueLabel: {
                        Text("\(current)")
                            .foregroundColor(Color.green)
                    } minimumValueLabel: {
                        Text("\(minValue)")
                            .foregroundColor(Color.green)
                    } maximumValueLabel: {
                        Text("\(maxValue)")
                            .foregroundColor(Color.red)
                    }
                        .gaugeStyle(.accessoryLinear)
                    Spacer().frame(height: 32)
                    Gauge(value: current, in: minValue...maxValue) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    } currentValueLabel: {
                        Text("\(current)")
                            .foregroundColor(Color.green)
                    } minimumValueLabel: {
                        Text("\(minValue)")
                            .foregroundColor(Color.green)
                    } maximumValueLabel: {
                        Text("\(maxValue)")
                            .foregroundColor(Color.red)
                    }
                        .gaugeStyle(.automatic)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Gauge",
            content: {
                gauge()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogGaugeView()
//}
