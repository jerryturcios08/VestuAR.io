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

    let sceneView = ARSCNView()

    private var closetItem: ClosetItem

    // MARK: - Initializers

    init(closetItem: ClosetItem) {
        self.closetItem = closetItem
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
        configureObjectInArView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureScene()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    // MARK: - Defined methods

    func configureScene() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        sceneView.session.run(configuration)
    }

    func configureScreen() {
        title = closetItem.name
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissScreen))
    }

    func configureArView() {
        view.addSubview(sceneView)
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        sceneView.snp.makeConstraints { $0.size.equalTo(view) }
    }

    func configureObjectInArView() {
        guard let path = Bundle.main.path(forResource: closetItem.filename, ofType: "usdz") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            // TODO: Figure out how to scale images to proper size and place them in front relative to user
            let objectScene = try SCNScene(url: url)
            guard let objectNode = objectScene.rootNode.childNode(withName: "dress", recursively: true) else { return }
            objectNode.position = SCNVector3(0, -200, -200)
            sceneView.scene.rootNode.addChildNode(objectNode)
        } catch {
            presentGenericAlert(title: "Error", message: "Failed to load object in ARView. Please re-select the clothing item and try again later.")
        }
    }

    // MARK: - Action methods

    @objc func dismissScreen() {
        dismiss(animated: true)
    }
}
