//
//  Model.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//
import SwiftData
import Foundation

//
//class Network {
//    
//    static func fetchData(modelContext: ModelContext) async throws{
//        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { throw URLSessionErrors.URLBuildingError } // MAKING URL
//        
//        let (data, response) = try await URLSession.shared.data(from: url) // GET RESPONSE
//        
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { // CHECK RESPONSE
//            throw URLSessionErrors.InvalidResponse
//        }
//        
//        do{
//            let data = try JSONDecoder().decode([User].self, from: data) // TRY TO DECODE DATA
//        } catch {
//            print(error)
//            throw URLSessionErrors.InvalidData
//        }
//        
//        data.forEach{ modelContext.insert($0) }
//        
//        
//        
//    }
//    
//    enum URLSessionErrors: LocalizedError{
//        case somethingWrong
//        case URLBuildingError
//        case InvalidResponse
//        case InvalidData
//    }
//    
//}
