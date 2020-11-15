//
//  SizingScreen.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class SizingScreen: UIViewController {
    // MARK: - Properties

    let entryLabel = VTTitleLabel(textAlignment: .center, fontSize: 20, weight: .semibold)
    let inseamLabel = VTTitleLabel(textAlignment: .left, fontSize: 20, weight: .semibold)
    let inseamTextField = VTTextField(placeholder: nil, keyboardType: .decimalPad)
    let waistLabel = VTTitleLabel(textAlignment: .left, fontSize: 20, weight: .semibold)
    let waistTextField = VTTextField(placeholder: nil, keyboardType: .decimalPad)
    let chestLabel = VTTitleLabel(textAlignment: .left, fontSize: 20, weight: .semibold)
    let chestTextField = VTTextField(placeholder: nil, keyboardType: .decimalPad)
    let shoulderLabel = VTTitleLabel(textAlignment: .left, fontSize: 20, weight: .semibold)
    let shoulderTextField = VTTextField(placeholder: nil, keyboardType: .decimalPad)
    let measureButton = VTButton(title: "Measure", fontSize: 32)

    var inseamMeasurement = 0.0
    var waistMeasurement = 0.0
    var chestMeasurement = 0.0
    var shoulderMeasurement = 0.0

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createDismissKeyboardTapGesture()
        configureEntryLabel()
        configureInseamSection()
        configureWaistSection()
        configureChestSection()
        configureShoulderSection()
        configureMeasureButton()
    }

    // MARK: - Defined methods

    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    func configureEntryLabel() {
        view.addSubview(entryLabel)
        entryLabel.text = "Manual Entry"

        entryLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(12)
        }
    }

    func configureInseamSection() {
        inseamLabel.text = "Inseam"
        inseamTextField.addTarget(self, action: #selector(inseamTextFieldChanged), for: .editingChanged)

        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubviews(UIView(), inseamLabel, inseamTextField, UIView())

        stackView.snp.makeConstraints { make in
            make.top.equalTo(entryLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }

    func configureWaistSection() {
        waistLabel.text = "Waist"
        waistTextField.addTarget(self, action: #selector(waistTextFieldChanged), for: .editingChanged)

        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubviews(UIView(), waistLabel, waistTextField, UIView())

        stackView.snp.makeConstraints { make in
            make.top.equalTo(inseamLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }

    func configureChestSection() {
        chestLabel.text = "Chest"
        chestTextField.addTarget(self, action: #selector(chestTextFieldChanged), for: .editingChanged)

        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubviews(UIView(), chestLabel, chestTextField, UIView())

        stackView.snp.makeConstraints { make in
            make.top.equalTo(waistLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }

    func configureShoulderSection() {
        shoulderLabel.text = "Waist"
        shoulderTextField.addTarget(self, action: #selector(shoulderTextFieldChanged), for: .editingChanged)

        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubviews(UIView(), shoulderLabel, shoulderTextField, UIView())

        stackView.snp.makeConstraints { make in
            make.top.equalTo(chestLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }

    func configureMeasureButton() {
        view.addSubview(measureButton)

        measureButton.snp.makeConstraints { make in
            make.top.equalTo(shoulderLabel.snp.bottom).offset(80)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(70)
        }
    }

    // MARK: - Action methods

    @objc func inseamTextFieldChanged(_ textField: UITextField) {
        guard let text = textField.text, let measurement = Double(text) else { return }
        inseamMeasurement = measurement
    }

    @objc func waistTextFieldChanged(_ textField: UITextField) {
        guard let text = textField.text, let measurement = Double(text) else { return }
        waistMeasurement = measurement
    }

    @objc func chestTextFieldChanged(_ textField: UITextField) {
        guard let text = textField.text, let measurement = Double(text) else { return }
        chestMeasurement = measurement
    }

    @objc func shoulderTextFieldChanged(_ textField: UITextField) {
        guard let text = textField.text, let measurement = Double(text) else { return }
        shoulderMeasurement = measurement
    }

    @objc func measureButtonTapped(_ sender: UIButton) {
        // TODO: Take data and push to measure AR view screen
    }
}
