//
//  ViewController.swift
//  ReStructV
//
//  Created by Hafiz on 29/12/2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // define lazy views
    lazy var headerView: HeaderView = {
        let headerView = HeaderView(frame: .zero)
        return headerView
    }()
    
    lazy var postView: PostView = {
        let view = PostView(frame: .zero)
        return view
    }()
    
    
    private lazy var buttonView = ButtonView(frame: .zero)
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, postView, buttonView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    func setupView() {
        // cosmetics
        view.backgroundColor = .systemBackground
        // constraints
        // added postView
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.topMargin)
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.leading.trailing.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints { make in
            make.height.equalTo(ButtonView.height)
        }
    }
    
    func setupData() {
        // navigation title
        self.title = "Lorem Ipsum"
        // demo data
        let store = DemoStore.shared
        let headerTitle = store.authorName
        let headerSubtitle = store.authorRole
        let headerImage = UIImage(named: store.authorImageName)
        let postTitle = store.postTitle
        let postSubtitle = store.postDetails
        
        postView.postTitleLabel.text = postTitle
        postView.textView.text = postSubtitle
        headerView.configure(title: headerTitle, subtitle: headerSubtitle, image: headerImage)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        ViewController().showPreview()
    }
}
#endif
