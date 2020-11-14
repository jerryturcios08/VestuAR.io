//
//  HomeScreen.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class ClosetScreen: UIViewController {
    // MARK: - Properties

    let closetTableView = UITableView()

    var closetItems = ClosetItem.getSampleCloset()

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureClosetTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = closetTableView.indexPathForSelectedRow {
            closetTableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: - Defined methods

    func configureClosetTableView() {
        view.addSubview(closetTableView)
        closetTableView.rowHeight = 100
        closetTableView.separatorStyle = .none
        closetTableView.dataSource = self
        closetTableView.delegate = self
        closetTableView.register(ClosetItemCell.self, forCellReuseIdentifier: ClosetItemCell.reuseId)
        closetTableView.snp.makeConstraints { $0.size.equalTo(view) }
    }
}

// MARK: - Table view methods

extension ClosetScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return closetItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetItemCell.reuseId, for: indexPath) as! ClosetItemCell
        let closetItem = closetItems[indexPath.row]
        cell.set(closetItem: closetItem)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let closetItem = closetItems[indexPath.row]
        let closetItemScreen = ClosetItemScreen(closetItemName: closetItem.name)
        let destinationScreen = VTNavigationController(rootViewController: closetItemScreen)
        destinationScreen.modalPresentationStyle = .fullScreen
        present(destinationScreen, animated: true)
    }
}
