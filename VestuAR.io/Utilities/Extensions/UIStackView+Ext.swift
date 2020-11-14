//
//  UIStackView+Ext.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) { views.forEach(addArrangedSubview) }
}
