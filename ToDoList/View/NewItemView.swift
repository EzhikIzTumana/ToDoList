import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Button("Save"){
                    viewModel.save()
                    newItemPresented = false
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
