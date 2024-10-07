//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 1/10/24.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"

    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?

    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.layer.masksToBounds = true

        return imageView
    }()

    private let postsButtons: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()

    private let followingButtons: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()

    private let followersButtons: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()

    private let editProfilebutton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joe Smith"
        label.textColor = .label
        label.numberOfLines = 1

        return label
    }()

    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first account!"
        label.textColor = .label
        label.numberOfLines = 0

        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }

    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButtons)
        addSubview(followingButtons)
        addSubview(followersButtons)
        addSubview(editProfilebutton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }

    private func addButtonActions() {
        followersButtons.addTarget(
            self,
            action: #selector(didTapFollowersButton),
            for: .touchUpInside
        )

        followingButtons.addTarget(
            self,
            action: #selector(didTapFollowingButton),
            for: .touchUpInside
        )

        postsButtons.addTarget(
            self,
            action: #selector(didTapPostsButton),
            for: .touchUpInside
        )

        editProfilebutton.addTarget(
            self,
            action: #selector(didTapEditProfileButton),
            for: .touchUpInside
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let profilePhotoSize = width / 4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0

        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width - 10 - profilePhotoSize) / 3

        postsButtons.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral

        followersButtons.frame = CGRect(
            x: postsButtons.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral

        followingButtons.frame = CGRect(
            x: followersButtons.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral

        editProfilebutton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight,
            width: countButtonWidth * 3,
            height: buttonHeight
        ).integral

        nameLabel.frame = CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom,
            width: width - 10,
            height: 50
        )

        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLabel.bottom,
            width: width - 10,
            height: bioLabelSize.height
        )
    }

    // MARK: - Actions

    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }

    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }

    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }

    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
