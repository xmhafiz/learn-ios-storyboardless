//
//  ButtonView.swift
//  ReStructV
//
//  Created by Hafiz on 05/04/2021.
//

import UIKit
import SnapKit

class ButtonView: UIView {
    let buttonHeight: CGFloat = 54
    static let height: CGFloat = 86
    lazy var demoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = button.tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight/2
        button.clipsToBounds = true
        return button
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(demoButton)
        demoButton.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
