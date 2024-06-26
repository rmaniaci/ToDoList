//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ross Maniaci on 6/26/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoItem.self)
    }
}
