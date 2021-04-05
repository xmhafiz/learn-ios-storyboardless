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
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .darkGray
        textView.showsVerticalScrollIndicator = false
        textView.textAlignment = .justified
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
    
    private lazy var mainStackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.headerView, postTitleLabel, textView, demoButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16.0
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
