import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var listViewModel: ToDoListViewViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Date", selection: $viewModel.dueDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Button("Save"){
                    if viewModel.title.isEmpty {
                        showAlert = true
                    }
                    else {
                        let newItem = ToDoListItem(dueDate: viewModel.dueDate.timeIntervalSince1970, title: viewModel.title)
                        listViewModel.addItem(newItem)
                        newItemPresented = false
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please enter a title"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true), listViewModel: ToDoListViewViewModel())
}
