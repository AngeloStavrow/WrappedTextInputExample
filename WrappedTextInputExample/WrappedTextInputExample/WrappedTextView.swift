import SwiftUI

struct WrappedTextView: UIViewRepresentable {

    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        var didBecomeFirstResponder: Bool = false

        init(text: Binding<String>) {
            _text = text
        }

        func textViewDidChangeSelection(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.text = textView.text ?? ""
            }
        }
    }

    @Binding var text: String
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<WrappedTextView>) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        return textView
    }

    func makeCoordinator() -> WrappedTextView.Coordinator {
        return Coordinator(text: $text)
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<WrappedTextView>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
