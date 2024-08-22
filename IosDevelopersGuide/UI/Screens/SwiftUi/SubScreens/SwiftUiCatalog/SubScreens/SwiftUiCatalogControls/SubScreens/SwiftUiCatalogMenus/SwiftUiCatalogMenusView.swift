//
//  SwfitUiMenu.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogMenusView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogMenusViewModel
    
    func menu() -> some View {
        return CustomSection(
            snippetTitle: "Menu",
            snippetDescription: """
            A control for presenting a menu of actions.
            """,
            snippetCode: """
            Menu(content: {
                ControlGroup {
                    Button(action: {

                    }) {
                        Image(systemName: "pin.fill")
                    }
                    
                    Button(action: {

                    }) {
                        Image(systemName: "lock")
                    }
                    
                    Button(action: {

                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
                Section {
                    Button(action: {

                    }) {
                        Label("Move File", systemImage: "folder")
                    }
                    
                    Button(action: {

                    }) {
                        Label("New Folder", systemImage: "folder.badge.plus")
                    }
                }
                
                Menu(
                    content: {
                        Button(action: {

                        }) {
                            Label("Copy", systemImage: "doc.on.doc")
                        }
                        Button(action: {

                        }) {
                            Label("Favorite", systemImage: "heart")
                        }
                        Button(action: {

                        }
                    ) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }, label: {
                    Text("Submenu")
                })
                
                Divider()
                
                Button(role: .destructive, action: {
                    
                }) {
                    Label("Delete", systemImage: "trash")
                }
            }, label: {
                Text("Show Menu")
                    .foregroundColor(.black)
            })
                .menuStyle(.button)
            """,
            demoView: {
                Menu(content: {
                    ControlGroup {
                        Button(action: {

                        }) {
                            Image(systemName: "pin.fill")
                        }
                        
                        Button(action: {

                        }) {
                            Image(systemName: "lock")
                        }
                        
                        Button(action: {

                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    
                    Section {
                        Button(action: {

                        }) {
                            Label("Move File", systemImage: "folder")
                        }
                        
                        Button(action: {

                        }) {
                            Label("New Folder", systemImage: "folder.badge.plus")
                        }
                    }
                    
                    Menu(
                        content: {
                            Button(action: {

                            }) {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                            Button(action: {

                            }) {
                                Label("Favorite", systemImage: "heart")
                            }
                            Button(action: {

                            }
                        ) {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                    }, label: {
                        Text("Submenu")
                    })
                    
                    Divider()
                    
                    Button(role: .destructive, action: {
                        
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                }, label: {
                    Text("Show Menu")
                })
                    .menuStyle(.button)
            }
        )
    }

    func contextMenu() -> some View {
        return CustomSection(
            snippetTitle: "Context menu",
            snippetDescription: """
            A control for presenting a contextually appropriate menu of buttons.
            """,
            snippetCode: """
            Button(action: {

            }, label: {
                Text("Context menu (Touch and hold)")
            })
            .padding(8)
            .contextMenu {
                Button(action: {
                    
                }) {
                    Label("Copy", systemImage: "doc.on.doc")
                }
                Button(action: {
                    
                }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: {
                    
                }) {
                    Label("Favorite", systemImage: "heart")
                }
                Divider()
                Button(action: {
                    
                }) {
                    Label("Remove", systemImage: "trash")
                }
            }
            """,
            demoView: {
                Button(action: {

                }, label: {
                    Text("Context menu (Touch and hold)")
                })
                .padding(8)
                .contextMenu {
                    Button(action: {
                        
                    }) {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(action: {
                        
                    }) {
                        Label("Favorite", systemImage: "heart")
                    }
                    Divider()
                    Button(action: {
                        
                    }) {
                        Label("Remove", systemImage: "trash")
                    }
                }
            }
        )
    }

    func commandMenu() -> some View {
        return CustomSection(
            snippetTitle: "Command menu",
            snippetDescription: """
            Command menus are standalone, top level containers for controls that are related, app-specific commands.
            """,
            snippetCode: """
            var body: some Scene {
                WindowGroup {
                    ContentView()
                }.commands {
                    AppCommands()
                }
            }

            struct AppCommands: Commands {
                @CommandsBuilder var body: some Commands {
                    CommandMenu("Command Menu", content: {
                        Button("Show Documentation") {
                        
                        }.keyboardShortcut("D", modifiers: .control)
                        
                        Button("Show Snippet") {
                        
                        }.keyboardShortcut("C", modifiers: .control)
                    })
                }
            }
            """,
            demoView: {
            
            }
        )
    }

    
    var body: some View {
        PageScaffold(
            pageTitle: "Menus",
            content: {
                menu()
                contextMenu()
                commandMenu()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogMenusView()
//}
