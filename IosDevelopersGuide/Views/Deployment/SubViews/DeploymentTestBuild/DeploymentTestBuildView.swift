//
//  DeploymentTestBuild.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct DeploymentTestBuildView: View {
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
            pageTitle: "Deploy test build",
            content: {
            }
        )
    }
}

#Preview {
    DeploymentTestBuildView()
}
