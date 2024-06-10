//
//  DetailView.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        Form{
            Section{
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Email: \(user.email)")
                                .font(.system(size: 15))
                            Text("\(user.displayedDate)")
                                .font(.system(size: 15))
                        }
                        Spacer()
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(user.isActive ? .green : .gray)
                    }
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(user.tags, id: \.self){ tag in
                                Text("#\(tag)")
                                    .padding()
                                    .frame(height: 30)
                                    .frame(minWidth: 40)
                                    .background(.black)
                                    .clipShape(Capsule())
                                    .foregroundStyle(.white)
                                    .fontWeight(.heavy)
                            }
                        }
                        
                    }
                    .padding(.top, 5)
                    .scrollIndicators(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                    
                    Text("About")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                    Text(user.about)
                    
                    Text("Friends")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.top, 20)
                    
                    List(user.friends, id: \.id){friend in
                        HStack{
                            Circle()
                                .foregroundStyle(.black)
                                .frame(height: 5)
                                .padding(.trailing, 5)
                            Text(friend.name)
                        }
                    }
                }
            }
        }
        .navigationTitle(user.name)
    }
}











#Preview {
    DetailView(user: User(
        id: "50a48fa3-2c0f-4397-ac50-64da464f9954",
        isActive: true, name: "Alford Rodriguez",
        age: 21,
                          company: "Imkan",
                          email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
                          about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
                          registered: "2015-11-10T01:47:18-00:00",
                          tags: ["irure","labore","et","sint","velit","mollit","et"],
                          friends: [Friend(id: "someid123", name: "Gamid")]))
}
