//
//  ProfileTabsCollectionReusableView.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 1/10/24.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
