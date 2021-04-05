//
//  HeaderView.swift
//  ReStructV
//
//  Created by Hafiz on 30/12/2020.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    let imageHeight: CGFloat = 80
    lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.equalTo(imageHeight)
            make.height.equalTo(imageHeight)
        }
        imageView.layer.cornerRadius = imageHeight/2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                                        titleLabel,
                                        subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                                        headerImageView,
                                        textStackView])
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.alignment = .center
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        configure(title: "John Smith", subtitle: "Lorem Ipsum", image: nil)
    }
    
    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        headerImageView.image = image
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HeaderView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        HeaderView().showPreview()
    }
}
#endif
