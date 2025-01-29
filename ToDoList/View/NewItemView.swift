import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var listViewModel: ToDoListViewViewModel
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Date", selection: $viewModel.dueDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Button("Save"){
                    let newItem = ToDoListItem(dueDate: viewModel.dueDate.timeIntervalSince1970, title: viewModel.title)
                        listViewModel.addItem(newItem) 
                        newItemPresented = false
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true), listViewModel: ToDoListViewViewModel())
}
