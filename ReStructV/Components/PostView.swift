//
//  PostView.swift
//  ReStructV
//
//  Created by Hafiz on 05/04/2021.
//

import UIKit
import SnapKit

class PostView: UIView {
    lazy var postTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = .darkGray
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postTitleLabel, textView])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        return scrollView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        // cosmetics
        backgroundColor = .systemBackground
        
        // constraints
        scrollView.addSubview(bodyStackView)
        scrollView.contentSize = bodyStackView.frame.size
        
        bodyStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width).inset(24)
        }
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PostView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        PostView().showPreview()
    }
}
#endif
