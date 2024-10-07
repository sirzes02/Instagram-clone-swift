//
//  FormTableViewCell.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 1/10/24.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?)
}

class FormTableViewCell: UITableViewCell {
    static let identifier = "FormTableViewCell"

    private var model: EditProfileFormModel?

    public weak var delegate: FormTableViewCellDelegate?

    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1

        return label
    }()

    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done

        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    public func configure(with model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        formLabel.frame = CGRect(
            x: 5,
            y: 0,
            width: contentView.width / 3,
            height: contentView.height
        )
        field.frame = CGRect(
            x: formLabel.right + 5,
            y: 0,
            width: contentView.width - 10 - formLabel.right,
            height: contentView.height
        )
    }
}

extension FormTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard var model = model else {
            return true
        }

        model.value = textField.text
        delegate?.formTableViewCell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
}
