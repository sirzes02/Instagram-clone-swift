//
//  IGFeedPostTableViewCell.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 30/09/24.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    static let identifier = "IGFeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    public func configure() {}
}
