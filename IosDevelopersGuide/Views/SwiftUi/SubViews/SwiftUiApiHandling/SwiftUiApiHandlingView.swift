//
//  SwiftUiApiHandling.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import Combine

struct SwiftUiApiHandlingView: View {
    @EnvironmentObject var apiService: ApiService
    @State var userData: UserData?
    @State var todoData: TodoData?
    @State var getRequestStatus: Bool = false
    @State var postRequestStatus: Bool = false
    @State var isLoading: Bool = false
    
    func getRequest() -> some View {
        func fetchUserData() async {
            isLoading = true
            userData = try! await apiService.getRequest()
            isLoading = false
        }
        
        return CustomSection(
            snippetTitle: "Get request",
            snippetDescription: """
            Get request to fetch data, caste into models and use on the screens.
            """,
            snippetCode: """
            class ApiService: ObservableObject {
                func getRequest() async throws -> UserData {
                    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
                    var userData = UserData()
                    
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        let users = try JSONDecoder().decode([UserData.User].self, from: data)
                        userData.users = users
                    } catch {
                        userData.error = "\\(error)"
                    }
                    
                    return userData
                }
            }
            
            //  apiService is already passed in environment to root view
            @EnvironmentObject var apiService: ApiService
            @State var userData: UserData?
            @State var getRequestStatus: Bool = false
            @State var isLoading: Bool = false
            
            VStack(alignment: .leading) {
                Button("Make request")  {
                    Task {
                        getRequestStatus = true
                        await fetchUserData()
                    }
                }
                
                Spacer().frame(height: 16)
                
                if(getRequestStatus) {
                    if(isLoading) {
                        Text("Loading...")
                    } else {
                        if(userData?.users != nil) {
                            Text(
                                \"""
                                User data from API:
                                
                                Name  : \\((userData?.users?[0].name)!)
                                Email : \\((userData?.users?[0].email)!)
                                Phone : \\((userData?.users?[0].phone)!)
                                \"""
                            )
                        } else {
                            Text("\\(userData?.error ?? "Something went wrong")")
                        }
                    }
                }
                else {
                    Text("The requested data will appear here.")
                }
            }
            """,
            demoView: {
                VStack(alignment: .leading) {
                    Button("Make request")  {
                        Task {
                            getRequestStatus = true
                            await fetchUserData()
                        }
                    }
                    
                    Spacer().frame(height: 16)
                    
                    if(getRequestStatus) {
                        if(isLoading) {
                            Text("Loading...")
                        } else {
                            if(userData?.users != nil) {
                                Text(
                                    """
                                    User data from API:
                                    
                                    Name  : \((userData?.users?[0].name)!)
                                    Email : \((userData?.users?[0].email)!)
                                    Phone : \((userData?.users?[0].phone)!)
                                    """
                                )
                            } else {
                                Text("\(userData?.error ?? "Something went wrong")")
                            }
                        }
                    }
                    else {
                        Text("The requested data will appear here.")
                    }
                }
            }
        )
    }
    
    
    func postRequest() -> some View {
        func postTodoData() async {
            isLoading = true
            todoData = try! await apiService.postRequest(
                userId: "19",
                title: "Mayank",
                completed: true
            )
            isLoading = false
        }
        
        return CustomSection(
            snippetTitle: "Post request",
            snippetDescription: """
            Post request to send data.
            """,
            snippetCode: """

            """,
            demoView: {
                VStack(alignment: .leading) {
                    Button("Make request")  {
                        Task {
                            postRequestStatus = true
                            await postTodoData()
                        }
                    }
                    
                    Spacer().frame(height: 16)
                    
                    if(postRequestStatus) {
                        if(isLoading) {
                            Text("Loading...")
                        } else {
                            //                            if(todoData != nil) {
                            //                                Text(
                            //                                    """
                            //                                    Todo data from API:
                            //
                            //                                    userId    : \((todoData?.userId)!)
                            //                                    title     : \((todoData?.title)!)
                            //                                    completed : \((todoData?.completed)!)
                            //                                    """
                            //                                )
                            //                            } else {
                            //                                Text("\(todoData?.error ?? "Something went wrong")")
                            //                            }
                            
                            Text("Request successfull")
                        }
                    }
                    else {
                        Text("The data is send automatically in the body parameter of the request.")
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "API handling",
            content: {
                getRequest()
                postRequest()
            }
        )
    }
}

#Preview {
    SwiftUiApiHandlingView()
}
