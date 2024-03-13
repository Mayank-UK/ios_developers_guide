//
//  SwiftUiSupportingClassesAndEnums.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiSupportingClassesAndEnumsView: View {
    func _temp() -> some View {
        return CustomSection(
            snippetTitle: "",
            snippetDescription: """
            
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Supporting classes and enums",
            content: {
            }
        )
    }
}

#Preview {
    SwiftUiSupportingClassesAndEnumsView()
}
