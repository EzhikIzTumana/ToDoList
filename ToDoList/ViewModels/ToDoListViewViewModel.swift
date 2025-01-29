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
    
    init() {}
}
