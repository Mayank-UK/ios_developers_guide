//
//  SwiftUiChartView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI
import Charts

struct SwiftUiCatalogChartView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogChartViewModel
    
    // had to use this to prevent "'SwiftUiCatalogChartView' initializer is inaccessible due to 'private' protection level" in router
    init(viewModel: SwiftUiCatalogChartViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    struct BarData: Identifiable {
        let department: String
        let profit: Double
        let productCategory: String
        var id = UUID()
    }
    
    private var barData: [BarData] = [
        BarData(department: "Production", profit: 4000, productCategory: "Gizmos"),
        BarData(department: "Production", profit: 5000, productCategory: "Gadgets"),
        BarData(department: "Production", profit: 6000, productCategory: "Widgets"),
        BarData(department: "Marketing", profit: 2000, productCategory: "Gizmos"),
        BarData(department: "Marketing", profit: 1000, productCategory: "Gadgets"),
        BarData(department: "Marketing", profit: 5000, productCategory: "Widgets"),
        BarData(department: "Finance", profit: 2000, productCategory: "Gizmos"),
        BarData(department: "Finance", profit: 3000, productCategory: "Gadgets"),
        BarData(department: "Finance", profit: 5000, productCategory: "Widgets")
    ]

    func barMark() -> some View {
        return CustomSection(
            snippetTitle: "BarMark",
            snippetDescription: """
            Represent data in terms of bars.
            """,
            snippetCode: """
            struct BarData: Identifiable {
                let department: String
                let profit: Double
                let productCategory: String
                var id = UUID()
            }
            private var data: [BarData] = [
                BarData(department: "Production", profit: 4000, productCategory: "Gizmos"),
                BarData(department: "Production", profit: 5000, productCategory: "Gadgets"),
                BarData(department: "Production", profit: 6000, productCategory: "Widgets"),
                BarData(department: "Marketing", profit: 2000, productCategory: "Gizmos"),
                BarData(department: "Marketing", profit: 1000, productCategory: "Gadgets"),
                BarData(department: "Marketing", profit: 5000, productCategory: "Widgets"),
                BarData(department: "Finance", profit: 2000, productCategory: "Gizmos"),
                BarData(department: "Finance", profit: 3000, productCategory: "Gadgets"),
                BarData(department: "Finance", profit: 5000, productCategory: "Widgets")
            ]

            Chart(data) {
                BarMark(
                    x: .value("Category", $0.department),
                    y: .value("Profit", $0.profit),
                    stacking: .standard
                ).foregroundStyle(by: .value("Product Category", $0.productCategory))
            }
                .frame(width: .infinity, height: 256)
            """,
            demoView: {
                Chart(barData) {
                    BarMark(
                        x: .value("Category", $0.department),
                        y: .value("Profit", $0.profit),
                        stacking: .standard
                    ).foregroundStyle(by: .value("Product Category", $0.productCategory))
                }
                    .frame(width: .infinity, height: 256)
            }
        )
    }
    
    
    func sectorMark() -> some View {
        return CustomSection(
            snippetTitle: "SectorMark",
            snippetDescription: """
            Represent data in terms of sectors.
            """,
            snippetCode: """
            
            """,
            demoView: {
                
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Chart",
            content: {
                barMark()
                sectorMark()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogChartView()
//}
