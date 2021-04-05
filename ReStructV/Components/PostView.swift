//
//  PostView.swift
//  ReStructV
//
//  Created by Hafiz on 05/04/2021.
//

import UIKit
import SnapKit

class PostView: UIView {
    let imageHeight: CGFloat = 80
    lazy var headerView: HeaderView = {
        let headerView = HeaderView(frame: .zero)
        return headerView
    }()
    
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
    
    
    let buttonHeight: CGFloat = 54
    lazy var demoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = button.tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight/2
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postTitleLabel, textView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16.0
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = { 
        let stackView = UIStackView(arrangedSubviews: [headerView, scrollView, demoButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24.0
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // cosmetics
        backgroundColor = .systemBackground
        
        // constraints
        scrollView.addSubview(bodyStackView)
        scrollView.contentSize = bodyStackView.frame.size
        
        bodyStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
        
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
        
        demoButton.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
        }
    }
}
