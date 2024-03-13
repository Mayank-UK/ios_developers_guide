//
//  SwiftUiIconsAndImages.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiIconsAndImagesView: View {
    func icons() -> some View {
        return CustomSection(
            snippetTitle: "Icons",
            snippetDescription: """
            Without resizable modifier, the icon/image will take it's default dimensions.
            """,
            snippetCode: """
            
            """,
            demoView: {
                HStack {
                    Image(systemName: "star.fill")
                    Image("home")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
        )
    }
    
    func images() -> some View {
        return CustomSection(
            snippetTitle: "Images",
            snippetDescription: """
            Icons and images both use Imaage() view in SwiftUI.
            It will be necessary to provide resizable() modifier to every image to render it properly along with mentioning it's aspect ratio.
            """,
            snippetCode: """
            
            """,
            demoView: {
                Image("family")
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 128)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Icons and images",
            content: {
                icons()
                images()
            }
        )
    }
}

#Preview {
    SwiftUiIconsAndImagesView()
}
