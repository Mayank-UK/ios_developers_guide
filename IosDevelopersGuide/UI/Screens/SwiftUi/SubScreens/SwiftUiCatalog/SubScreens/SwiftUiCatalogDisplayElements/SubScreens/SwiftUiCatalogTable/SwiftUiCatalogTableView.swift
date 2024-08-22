//
//  SwiftUiTableView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogTableView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogTableViewModel
    
    @State private var sortOrder = [KeyPathComparator(\TableData.givenName)]
    struct TableData: Identifiable {
        let id = UUID()
        let givenName: String
        let familyName: String
        let emailAddress: String
        var fullName: String { givenName + " " + familyName }
    }
    @State private var data = [
        TableData(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
        TableData(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
        TableData(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
        TableData(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
    ]
    
    func table() -> some View {
        return CustomSection(
            snippetTitle: "Table",
            snippetDescription: """
            View to show table.
            """,
            snippetCode: """
            @State private var sortOrder = [KeyPathComparator(\\TableData.givenName)]
            struct TableData: Identifiable {
                let id = UUID()
                let givenName: String
                let familyName: String
                let emailAddress: String
                var fullName: String { givenName + " " + familyName }
            }
            @State private var data = [
                TableData(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
                TableData(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
                TableData(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
                TableData(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
            ]

            Table(data, sortOrder: $sortOrder) {
                TableColumn("Given Name", value: \\.givenName) { person in
                    VStack(alignment: .leading) {
                        Text(person.fullName)
                        Text(person.emailAddress)
                            .foregroundStyle(.secondary)
                    }
                }
                TableColumn("Family Name", value: \\.familyName)
                TableColumn("E-Mail Address", value: \\.emailAddress)
            }
                .frame(height: 256)
                .onChange(of: sortOrder) { oldValue, newValue in
                    data.sort(using: newValue)
                }
            """,
            demoView: {
                Table(data, sortOrder: $sortOrder) {
                    TableColumn("Given Name", value: \.givenName) { person in
                        VStack(alignment: .leading) {
                            Text(person.fullName)
                            Text(person.emailAddress)
                                .foregroundStyle(.secondary)
                        }
                    }
                    TableColumn("Family Name", value: \.familyName)
                    TableColumn("E-Mail Address", value: \.emailAddress)
                }
                    .frame(height: 256)
                    .onChange(of: sortOrder) { oldValue, newValue in
                        data.sort(using: newValue)
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Table",
            content: {
                table()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogTableView()
//}
