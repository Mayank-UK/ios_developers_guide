//
//  SwiftUiCanvasView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogCanvasView: View {
    func canvas() -> some View {
        return CustomSection(
            snippetTitle: "Canvas",
            snippetDescription: """
            Canvas view allows you to draw rich and dynamic 2D graphics directly within your app.
            """,
            snippetCode: """
            Canvas { context, size in
                context.stroke(Path(ellipseIn: CGRect(origin: .zero, size: size)),
                   with: .color(.green),
                   lineWidth: 4)
            }
                .frame(width: .infinity, height: 256)
            """,
            demoView: {
                Canvas { context, size in
                    context.stroke(Path(ellipseIn: CGRect(origin: .zero, size: size)),
                       with: .color(.green),
                       lineWidth: 4)
                }
                    .frame(width: .infinity, height: 256)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Canvas",
            content: {
                canvas()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogCanvasView()
}
