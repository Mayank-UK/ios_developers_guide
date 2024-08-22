//
//  Deployment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DeploymentView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: DeploymentViewModel
    
    func testDeployment() -> some View {
        return CustomSection(
            snippetTitle: "Test deployment",
            snippetDescription: """
            
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    func prodDeployment() -> some View {
        return CustomSection(
            snippetTitle: "Prod deployment",
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
            pageTitle: "Deployment",
            content: {
                testDeployment()
                prodDeployment()
            }
        )
    }
}


//#Preview {
//    DeploymentView()
//}
