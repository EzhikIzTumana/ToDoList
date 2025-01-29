//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Maria Sytsko on 28.01.25.
//

import Foundation

class ToDoListViewViewModel: ObservableObject{
    @Published var items: [ToDoListItem] = []
    @Published var showingNewItemView = false
    
    func addItem(_ item: ToDoListItem) {
        items.append(item)
    }
    
    func deleteItem(id: UUID) {
        items.removeAll { item in
            item.id == id
        }
    }
    
    func toggleIsDone(id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isCompleted.toggle()
        }
    }

    
    init() {}
}
