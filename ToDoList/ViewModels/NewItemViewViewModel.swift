//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Maria Sytsko on 28.01.25.
//

import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    init() {}
}
