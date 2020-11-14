//
//  SizingScreen.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class SizingScreen: UIViewController {
    let entryContainerView = UIView()
    let entryLabel = VTTitleLabel(textAlignment: .center, fontSize: 20)
    let inseamLabel = VTTitleLabel(textAlignment: .left, fontSize: 20)
    let waistLabel = VTTitleLabel(textAlignment: .left, fontSize: 20)
    let chestLabel = VTTitleLabel(textAlignment: .left, fontSize: 20)
    let shoulderLabel = VTTitleLabel(textAlignment: .left, fontSize: 20)
    let measureButton = VTButton(title: "Measure", fontSize: 32)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureEntryContainerView()
        configureMeasureButton()
    }

    func configureEntryContainerView() {
        view.addSubview(entryContainerView)
        entryContainerView.backgroundColor = .black
        entryContainerView.layer.borderWidth = 1
        entryContainerView.layer.borderColor = UIColor.white.cgColor

        entryContainerView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(250)
        }
    }

    func configureEntryLabel() {
        entryContainerView.addSubview(entryLabel)
        entryLabel.text = "Manual Entry"
        entryLabel.textColor = .white

        entryLabel.snp.makeConstraints { make in
            make.top.equalTo(entryContainerView.snp.top).offset(12)
        }
    }

    func configureMeasureButton() {
        view.addSubview(measureButton)

        measureButton.snp.makeConstraints { make in
            make.top.equalTo(entryContainerView.snp.bottom).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(70)
        }
    }
}
