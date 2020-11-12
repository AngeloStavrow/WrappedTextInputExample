import SwiftUI

struct ContentView: View {
    @State private var textFieldText: String = ""
    @State private var textViewText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(textFieldText)
            WrappedTextField(text: $textFieldText, isFirstResponder: true)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Text(textViewText)
            WrappedTextView(text: $textViewText, isFirstResponder: false)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
