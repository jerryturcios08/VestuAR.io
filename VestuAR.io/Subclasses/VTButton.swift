//
//  VTButton.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class VTButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            layer.opacity = isHighlighted ? 0.5 : 1
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: String, fontSize: CGFloat) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: fontSize, weight: .semibold)
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(.black, for: .normal)
    }
}
