//
//  Previews.swift
//  ReStructV
//
//  Created by Vladislav Muravyev on 31.07.2024.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI
// This struct is used to wrap a UIView and provide a SwiftUI preview
@available(iOS 13.0, *)
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    // Initializer to accept a UIView instance
    init(_ builder: @escaping () -> View) {
        self.view = builder()
    }

    // Create the UIView instance to be used in the SwiftUI view hierarchy
    func makeUIView(context: Context) -> View {
        return view
    }

    // Update the UIView instance as needed (e.g., when state changes)
    func updateUIView(_ uiView: View, context: Context) {
        // Update the view if necessary
    }
}
#endif
