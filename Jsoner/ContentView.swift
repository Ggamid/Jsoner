//
//  ContentView.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]

    @State var isLoading = false
    var body: some View {
        NavigationStack{
            List(users, id: \.id){ user in
                NavigationLink(destination: {
                    DetailView(user: user)
                }, label: {
                    HStack{
                        VStack(alignment: .leading){
                            Text(user.name)
                            Text(user.email)
                                .fontWeight(.light)
                                .font(.caption)
                        }
                        Spacer()
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(user.isActive ? .green : .gray)
                    }
                })
                
                
            }
            .onAppear{
                Task{
                    do{
                        if users.isEmpty{
                            try await fetchData()
                        }
                    }catch URLSessionErrors.InvalidResponse {
                        print("invalid Response")
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                    
                }
            }
            .toolbar{
                ToolbarItem {
                    
                    Button{
                        try? modelContext.delete(model: User.self)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                ToolbarItem{
                    Button{
                        Task{
                            try? await fetchData()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Jsoner 📋")
        }
            
        
    }
}

extension ContentView {
    func fetchData() async throws{
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { throw URLSessionErrors.URLBuildingError } // MAKING URL
        
        let (data, response) = try await URLSession.shared.data(from: url) // GET RESPONSE
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { // CHECK RESPONSE
            throw URLSessionErrors.InvalidResponse
        }
        
        do{
            let data = try JSONDecoder().decode([User].self, from: data) // TRY TO DECODE DATA
            data.forEach{ user in
                modelContext.insert(user)
            }
        } catch {
            print(error)
            throw URLSessionErrors.InvalidData
        }
    }
    
    enum URLSessionErrors: LocalizedError{
        case somethingWrong
        case URLBuildingError
        case InvalidResponse
        case InvalidData
    }

}
#Preview {
    ContentView()
}


