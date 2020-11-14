//
//  ClosetItemScreen.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import ARKit
import UIKit

class ClosetItemScreen: UIViewController {
    // MARK: - Properties

    let arView = ARSCNView()

    private var closetItemName: String

    // MARK: - Initializers

    init(closetItemName: String) {
        self.closetItemName = closetItemName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        configureArView()
    }

    // MARK: - Defined methods

    func configureScreen() {
        title = closetItemName
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissScreen))
    }

    func configureArView() {
        view.addSubview(arView)
        arView.snp.makeConstraints { $0.size.equalTo(view) }
    }

    // MARK: - Action methods

    @objc func dismissScreen() {
        dismiss(animated: true)
    }
}
