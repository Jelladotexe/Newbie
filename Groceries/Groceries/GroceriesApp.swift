//
//  GroceriesApp.swift
//  Groceries
//
//  Created by admin on 3/11/24.
//

import SwiftUI
import SwiftData

@main
struct GroceriesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Groceries.self])
    }
}
