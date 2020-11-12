# WrappedTextInputExample

A sample project wrapping UITextField and UITextView in SwiftUI's UIViewRepresentable to get a minimally-viable replacement for SwiftUI's TextField and TextEditor controls, mainly to allow becoming first responder when the view appears. Based largely on [this Stack Overflow answer](https://stackoverflow.com/a/56508132).

There's a serious bug in this implementation, though — if you enter an emoji in either the wrapped UITextField or UITextView, then the first character you type will be inserted at the cursor, and then the cursor will jump to the end of the text content.
