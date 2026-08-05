//

// intentional: raw Color.* literals in this file are demo content that teaches
// SwiftUI concepts (e.g. what Color.green looks like) and must read literally.
//  SwiftUiFormView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogFormView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogFormViewModel
    
    @State private var inputText: String = ""
    @State private var date = Date()
    @State private var formValidityStatus = false
    @State private var formSubmitStatus = false
    
    func form() -> some View {
        func submit() {
            formSubmitStatus = true
        }
        
        return CustomSection(
            snippetTitle: "Form",
            snippetDescription: """
            Put the form controls inside Form() view, and strcture using Section() if required
            Use validators to make sure data input is proper
            """,
            snippetCode: """
            @State private var formValidityStatus = false
            @State private var formSubmitStatus = false
            
            Form {
                Text("Form validity status: \\(String(formValidityStatus))")
                Text("Submit status: \\(String(formSubmitStatus))")
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
                    Text("Form validity status: \(String(formValidityStatus))")
                    Text("Submit status: \(String(formSubmitStatus))")
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
            pageTitle: "Form",
            content: {
                form()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogFormView()
//}
