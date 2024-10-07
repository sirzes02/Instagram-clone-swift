//
//  PhotoCollectionViewCell.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 1/10/24.
//

import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User Post Image"
        accessibilityHint = "Double-tap to open post"
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    public func configure(with model: UserPost) {
        let url = model.thumbnailImage
        photoImageView.sd_setImage(with: url)
    }

    public func configure(debug imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
