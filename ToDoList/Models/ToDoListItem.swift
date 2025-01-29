//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Maria Sytsko on 29.01.25.
//

import Foundation

struct ToDoListItem: Identifiable {
    let id = UUID()
    let dueDate: TimeInterval
    let title: String
    var isCompleted: Bool = false
}
