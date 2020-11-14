//
//  VTNavigationController.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class VTNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}
