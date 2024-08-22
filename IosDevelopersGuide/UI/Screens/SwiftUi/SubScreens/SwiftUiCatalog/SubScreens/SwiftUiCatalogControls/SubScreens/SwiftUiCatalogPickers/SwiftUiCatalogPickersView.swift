//
//  SwiftUiPicker.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI
import PhotosUI

struct SwiftUiCatalogPickersView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogPickersViewModel
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry
        
        var id: String { self.rawValue }
    }
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var date = Date()
    @State private var color: Color = .accentColor
    @State private var selectedPhotoPickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    func menuPicker() -> some View {
        return CustomSection(
            snippetTitle: "Menu picker",
            snippetDescription: """
            A control for selecting from a set of mutually exclusive values in menu style.
            """,
            snippetCode: """
            enum Flavor: String, CaseIterable, Identifiable {
                case chocolate
                case vanilla
                case strawberry
                
                var id: String { self.rawValue }
            }
            @State private var selectedFlavor: Flavor = .chocolate
            
            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor)
                }
            }
            """,
            demoView: {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
            }
        )
    }
    
    func segmentedPicker() -> some View {
        return CustomSection(
            snippetTitle: "Segmented picker",
            snippetDescription: """
            A control for selecting from a set of mutually exclusive values in segmented style.
            """,
            snippetCode: """
            enum Flavor: String, CaseIterable, Identifiable {
                case chocolate
                case vanilla
                case strawberry
                
                var id: String { self.rawValue }
            }
            @State private var selectedFlavor: Flavor = .chocolate

            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor)
                }
            }
                .pickerStyle(SegmentedPickerStyle())
            """,
            demoView: {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
            }
        )
    }
    
    func datePicker() -> some View {
        return CustomSection(
            snippetTitle: "Date picker",
            snippetDescription: """
            A picker for selecting an absolute date and time.
            """,
            snippetCode: """
            @State private var date = Date()
            
            DatePicker(selection: $date,
                in: ...Date(),
                displayedComponents: .date,
                label: {
                    Text("Date")
                }
            )
            """,
            demoView: {
                DatePicker(
                    selection: $date,
                    in: ...Date(),
                    displayedComponents: .date,
                    label: {
                        Text("Date")
                    }
                )
            }
        )
    }
    
    func colorPicker() -> some View {
        return CustomSection(
            snippetTitle: "Color picker",
            snippetDescription: """
            A control used to select a color from the system color picker UI.
            """,
            snippetCode: """
            @State private var color: Color = .accentColor
            
            HStack {
                ColorPicker("Color", selection: $color)
                Rectangle()
                    .fill(color)
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                HStack {
                    ColorPicker("Color", selection: $color)
                    Rectangle()
                        .fill(color)
                        .frame(width: 64, height: 64)
                }
            }
        )
    }
    
    func photoPicker() -> some View {
        return CustomSection(
            snippetTitle: "Photos picker",
            snippetDescription: """
            A view that displays a Photos picker for choosing assets from photo library.
            """,
            snippetCode: """
            @State private var selectedPhotoPickerItem: PhotosPickerItem?
            @State private var selectedImage: Image?
            
            HStack {
                PhotosPicker(selection: $selectedPhotoPickerItem,
                    matching: .images) {
                    Text("Select photo")
                }
                Spacer().frame(width: 32)
                selectedImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
            }
            .onChange(of: selectedPhotoPickerItem) {
                Task {
                    if let loaded = try? await selectedPhotoPickerItem?.loadTransferable(type: Image.self) {
                        selectedImage = loaded
                    } else {
                        print("Failed")
                    }
                }
            }
            """,
            demoView: {
                HStack {
                    PhotosPicker(selection: $selectedPhotoPickerItem,
                        matching: .images) {
                        Text("Select photo")
                    }
                    Spacer().frame(width: 32)
                    selectedImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                }
                .onChange(of: selectedPhotoPickerItem) {
                    Task {
                        if let loaded = try? await selectedPhotoPickerItem?.loadTransferable(type: Image.self) {
                            selectedImage = loaded
                        } else {
                            print("Failed")
                        }
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Pickers",
            content: {
                menuPicker()
                segmentedPicker()
                datePicker()
                colorPicker()
                photoPicker()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogPickersView()
//}
