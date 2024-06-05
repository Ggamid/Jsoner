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
                        users = try await Network.fetchData()
                    }catch Network.URLSessionErrors.InvalidResponse {
                        print("invalid Response")
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                    
                }
            }
            .navigationTitle("Jsoner 📋")
        }
    }
}

extension ContentView {
    

}
#Preview {
    ContentView()
}

