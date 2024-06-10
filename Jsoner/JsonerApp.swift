//
//  JsonerApp.swift
//  Jsoner
//
//  Created by Gamıd Khalıdov on 04.06.2024.
//
import SwiftData
import SwiftUI

@main
struct JsonerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self])
    }
}
