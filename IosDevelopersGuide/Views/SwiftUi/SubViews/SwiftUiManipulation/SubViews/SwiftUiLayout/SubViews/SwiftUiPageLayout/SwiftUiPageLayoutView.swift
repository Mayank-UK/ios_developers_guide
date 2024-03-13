//
//  SwiftUiPageLayoutView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiPageLayoutView: View {
    func swiftUiPageLayout() -> some View {
        return CustomSection(
            snippetTitle: "SwiftUI page layout",
            snippetDescription: """
            A page/screen in swiftUI is created using s structure following View prototype, it has one computed property "body" that builds the UI.
            """,
            snippetCode: """
            import SwiftUI

            struct SwiftUiPageLayoutView: View {
                var body: some View {
                    Text("Hello world!")
                }
            }
            """,
            demoView: {}
        )
    }
    
    func dividingPageLayout() -> some View {
        return CustomSection(
            snippetTitle: "Dividing page layout",
            snippetDescription: """
            The UI on a page/screen can be divied into smalled units to make code more easier to read and manage, it can be done by dividing the UI into small separate functions.
            """,
            snippetCode: """
            import SwiftUI

            struct SwiftUiPageLayoutView: View {
                
                func helloWorld() -> some View {
                    return Text("Hello world!")
                }
                
                var body: some View {
                    VStack{
                        helloWorld()
                    }
                }
            }
            """,
            demoView: {}
        )
    }
    
    func uniformLayout() -> some View {
        return CustomSection(
            snippetTitle: "Uniform layout",
            snippetDescription: """
            The code for a page/screen should be uniformly written on all the screens, multiple screens should have uniformly written base structure code, for example you can create a reusable component like PageScaffold and use on all the screens.
            """,
            snippetCode: """
            import SwiftUI
            
            struct PageScaffold<Content: View>: View {
                let pageTitle: String
                private let children: Content
                
                init(pageTitle: String, @ViewBuilder content: @escaping () -> Content) {
                    self.children = content()
                    self.pageTitle = pageTitle
                }
                
                var body: some View {
                    ScrollView(.vertical){
                        Spacer().frame(height: 32)
                        children
                    }
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Text(pageTitle)
                                    .bold()
                                    .font(.system(size: 24))
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    
                }
            }

            struct SwiftUiPageLayoutView: View {
                
                func helloWorld() -> some View {
                    return Text("Hello world!")
                }
                
                var body: some View {
                    PageScaffold(
                        pageTitle: "Page layout",
                        content: {
                            helloWorld()
                        }
                    )
                }
            }
            """,
            demoView: {}
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Page layout",
            content: {
                swiftUiPageLayout()
                dividingPageLayout()
                uniformLayout()
            }
        )
    }
}

#Preview {
    SwiftUiPageLayoutView()
}
