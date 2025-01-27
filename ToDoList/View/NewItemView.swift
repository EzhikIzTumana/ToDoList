import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
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
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        
        }
    }
}

#Preview {
    NewItemView()
}
