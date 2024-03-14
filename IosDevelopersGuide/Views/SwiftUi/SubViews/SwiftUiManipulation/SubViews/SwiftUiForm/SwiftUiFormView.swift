//
//  SwiftUiForms.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiFormView: View {
    @State private var inputText: String = ""
    @State private var count: Int = 0
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry
        
        var id: String { self.rawValue }
    }
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var switchStatus: Bool = false
    @State private var date = Date()
    @State private var formValidityStatus = false
    @State private var formSubmitStatus = false
        
    func textInput() -> some View {
        return CustomSection(
            snippetTitle: "Input text field",
            snippetDescription: """
            Input from keyboard.
            """,
            snippetCode: """
            @State private var inputText: String = ""
            
            TextField("Input text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            """,
            demoView: {
                TextField("Input text", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        )
    }
    
    func buttonInput() -> some View {
        return CustomSection(
            snippetTitle: "Button input",
            snippetDescription: """
            Input from button to select, delete, submit, etc
            """,
            snippetCode: """
            @State private var count: Int = 0
            
            HStack{
                Button("Button") {
                    count += 1
                }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.black)
                Text("\\(count)")
            }
            """,
            demoView: {
                HStack{
                    Button("Button") {
                        count += 1
                    }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                    Text("\(count)")
                }
            }
        )
    }
        
    func radioInput() -> some View {
        return CustomSection(
            snippetTitle: "Radio input",
            snippetDescription: """
            Input from multiple sections in a radio style.
            Radio style is available for macOS, but not for iOS, instead it has SegmentedControl()
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
    
    func switchInput() -> some View {
        return CustomSection(
            snippetTitle: "Switch input",
            snippetDescription: """
            Input for a switch.
            """,
            snippetCode: """
            @State private var switchStatus: Bool = false
            
            Toggle(isOn: $switchStatus) {
                Text("Switch State: \\(switchStatus ? "On" : "Off")")
            }
            """,
            demoView: {
                Toggle(isOn: $switchStatus) {
                    Text("Switch State: \(switchStatus ? "On" : "Off")")
                }
            }
        )
    }
    
    func dropDownInput() -> some View {
        return CustomSection(
            snippetTitle: "Drop-down input",
            snippetDescription: """
            Input from multiple sections in a drop-down style.
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
                .pickerStyle(MenuPickerStyle())
            """,
            demoView: {
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                            .tag(flavor)
                    }
                }
                    .pickerStyle(MenuPickerStyle())
            }
        )
    }
    
    func dateInput() -> some View {
        return CustomSection(
            snippetTitle: "Date input",
            snippetDescription: """
            Input for date.
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
                DatePicker(selection: $date,
                    in: ...Date(),
                    displayedComponents: .date,
                    label: {
                        Text("Date")
                    }
                )
            }
        )
    }
    
    func formHandling() -> some View {
        func submit() {
            formSubmitStatus = true
        }
        
        return CustomSection(
            snippetTitle: "Form handling",
            snippetDescription: """
            Put the form controls inside Form() view, and strcture using Section() if required
            Use validators to make sure data input is proper
            """,
            snippetCode: """
            @State private var formValidityStatus = false
            @State private var formSubmitStatus = false
            
            Form {
                Text("Form validity status: \(formValidityStatus)")
                Text("Submit status: \(formSubmitStatus)")
                Section(header: Text("Section 1")) {
                    TextField("Input text", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: inputText) { oldValue, newValue in
                            formValidityStatus = textValidator(text: newValue) == nil ? true: false
                        }
                }

                Section(header: Text("Section 2")) {
                    DatePicker(selection: $date,
                        in: ...Date(),
                        displayedComponents: .date,
                        label: {
                            Text("Date")
                        }
                    )
                }
                
                
                Button(action: submit) {
                    Text("Submit")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(formValidityStatus ? Color.green: Color.gray)
                .disabled(!formValidityStatus)
            }
                .frame(height: 512)
            """,
            demoView: {
                Form {
                    Text("Form validity status: \(formValidityStatus)")
                    Text("Submit status: \(formSubmitStatus)")
                    Section(header: Text("Section 1")) {
                        TextField("Input text", text: $inputText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: inputText) { oldValue, newValue in
                                formValidityStatus = textValidator(text: newValue) == nil ? true: false
                            }
                    }

                    Section(header: Text("Section 2")) {
                        DatePicker(selection: $date,
                            in: ...Date(),
                            displayedComponents: .date,
                            label: {
                                Text("Date")
                            }
                        )
                    }
                    
                    
                    Button(action: submit) {
                        Text("Submit")
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(formValidityStatus ? Color.green: Color.gray)
                    .disabled(!formValidityStatus)
                }
                    .frame(height: 512)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Form inputs",
            content: {
                textInput()
                buttonInput()
                radioInput()
                switchInput()
                dropDownInput()
                dateInput()
                formHandling()
            }
        )
    }
}

#Preview {
    SwiftUiFormView()
}
