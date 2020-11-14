//
//  ClosetItemCell.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import SnapKit
import UIKit

class ClosetItemCell: UITableViewCell {
    // MARK: - Properties

    static let reuseId = "ClosetItem"

    let closetItemImageView = VTImageView(frame: .zero)
    let closetItemNameLabel = VTTitleLabel(textAlignment: .left, fontSize: 22)
    let closetItemCompanyLabel = VTBodyLabel(textAlignment: .left)
    let labelStackView = UIStackView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        configureClosetItemImageView()
        configureLabelStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Defined methods

    func set(closetItem: ClosetItem) {
        closetItemImageView.image = UIImage(named: closetItem.filename)
        closetItemNameLabel.text = closetItem.name
        closetItemCompanyLabel.text = closetItem.company
    }

    private func configureClosetItemImageView() {
        addSubview(closetItemImageView)

        closetItemImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.size.equalTo(80)
        }
    }

    private func configureLabelStackView() {
        addSubview(labelStackView)
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        labelStackView.addArrangedSubviews(closetItemNameLabel, closetItemCompanyLabel)

        labelStackView.snp.makeConstraints { make in
            make.centerY.equalTo(closetItemImageView)
            make.leading.equalTo(closetItemImageView.snp.trailing).offset(12)
        }
    }
}
