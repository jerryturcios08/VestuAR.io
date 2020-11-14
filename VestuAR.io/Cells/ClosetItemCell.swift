//
//  ClosetItemCell.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import SnapKit
import UIKit

class ClosetItemCell: UITableViewCell {
    static let reuseId = "ClosetItem"
    let closetItemImageView = VTImageView(frame: .zero)
    let closetItemNameLabel = VTTitleLabel(textAlignment: .left, fontSize: 22)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(closetItem: ClosetItem) {
        closetItemImageView.image = UIImage(named: closetItem.filename)
        closetItemNameLabel.text = closetItem.name
    }

    private func configure() {
        accessoryType = .disclosureIndicator
        configureClosetItemImageView()
        configureClosetItemNameLabel()
    }

    private func configureClosetItemImageView() {
        addSubview(closetItemImageView)

        closetItemImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).offset(20)
            make.size.equalTo(100)
        }
    }

    private func configureClosetItemNameLabel() {
        addSubview(closetItemNameLabel)

        closetItemNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(closetItemImageView)
            make.leading.equalTo(closetItemImageView.snp.trailing).offset(12)
        }
    }
}
