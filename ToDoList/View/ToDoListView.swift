//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Maria Sytsko on 28.01.25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
                
        }
    }
}

#Preview {
    ToDoListView()
}
