//
//  ContentView.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    var body: some View {
        Image(systemName: "globe")
        List(users, id: \.id){ user in
            Text(user.name)
            
        }
        .onAppear{
            Task{
                do{
                    users = try await fetchData()
                }catch URLSessionErrors.InvalidResponse {
                    print("invalid Response")
                }catch{
                    print(error.localizedDescription)
                }
                
                
            }
        }
    }
}

extension ContentView {
    
    func fetchData() async throws -> [User]{
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { throw URLSessionErrors.URLBuildingError }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLSessionErrors.InvalidResponse
        }
        
        do{
            return try JSONDecoder().decode([User].self, from: data)
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

