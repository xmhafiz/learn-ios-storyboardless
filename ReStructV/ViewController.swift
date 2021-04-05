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
    lazy var mainView: PostView = {
        let view = PostView(frame: .zero)
        return view
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
        // added mainView
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.topMargin)
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.leading.trailing.equalToSuperview()
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
        
        mainView.postTitleLabel.text = postTitle
        mainView.textView.text = postSubtitle
        mainView.headerView.configure(title: headerTitle, subtitle: headerSubtitle, image: headerImage)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct VCPreview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        ViewController().toPreview()
    }
}
#endif
