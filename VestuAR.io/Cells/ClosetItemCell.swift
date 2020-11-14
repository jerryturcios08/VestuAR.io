//
//  ClosetItemCell.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class ClosetItemCell: UITableViewCell {
    static let reuseId = "ClosetItem"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(closetItem: ClosetItem) {
    }

    private func configure() {
        // Configure cell styling
        // Add subviews
    }
}
