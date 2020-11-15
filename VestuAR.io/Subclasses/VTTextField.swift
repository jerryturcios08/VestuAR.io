//
//  VTTextField.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/14/20.
//

import UIKit

class VTTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(placeholder: String?, keyboardType: UIKeyboardType) {
        self.init()
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = .preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
    }
}
