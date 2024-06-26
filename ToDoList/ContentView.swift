//
//  ContentView.swift
//  ToDoList
//
//  Created by Ross Maniaci on 6/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var todoItems: [ToDoItem]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            List {
                ForEach(todoItems) { todoItem in
                    HStack {
                        Text(todoItem.name)
                        
                        Spacer()
                        
                        if todoItem.isComplete {
                            Image(systemName: "checkmark")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let itemToDelete = todoItems[index]
                        modelContext.delete(itemToDelete)
                    }
                })
            }
            
            .navigationTitle("To Do List")
            .toolbar {
                Button("", systemImage: "plus") {
                    modelContext.insert(generateRandomTodoItem())
                }
            }
        }
    }

    func generateRandomTodoItem() -> ToDoItem {
        let tasks = [ "Buy groceries", "Finish homework", "Go for a run", "Practice Yoga", "Read a book", "Write a blog post", "Clean the house", "Walk the dog", "Attend a meeting" ]

        let randomIndex = Int.random(in: 0..<tasks.count)
        let randomTask = tasks[randomIndex]
        
        return ToDoItem(name: randomTask, isComplete: Bool.random())
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self)
}
