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
                List(viewModel.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .gray)
                    }
                    .swipeActions{
                        Button{
                            viewModel.deleteItem(id: item.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView, listViewModel: viewModel)
                        }
                
        }
    }
}

#Preview {
    ToDoListView()
}
