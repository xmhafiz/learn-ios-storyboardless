//
//  Components_Preview.swift
//  ReStructV
//
//  Created by Vladislav Muravyev on 31.07.2024.
//

import SwiftUI
@available(iOS 13, *)
struct HeaderView_Preview: PreviewProvider {
    static var previews: some View {
        HeaderView().showPreview()
    }
}

@available(iOS 13, *)
struct PostView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = PostView()
            view.postTitleLabel.text =  DemoStore.shared.postTitle
            view.textView.text = DemoStore.shared.postDetails
            return view
        }.previewLayout(.sizeThatFits)
            .padding()
    }
    
}

@available(iOS 13, *)
struct ButtonView_Preview: PreviewProvider {
    static var previews: some View {
        ButtonView().showPreview().frame(width: 200,height: 88)
    }
}
