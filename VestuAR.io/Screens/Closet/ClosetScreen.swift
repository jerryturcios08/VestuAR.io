//
//  HomeScreen.swift
//  VestuAR.io
//
//  Created by Jerry Turcios on 11/13/20.
//

import UIKit

class ClosetScreen: UIViewController {
    let closetTableView = UITableView()

    var closetItems = ClosetItem.getSampleCloset()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = closetTableView.indexPathForSelectedRow {
            closetTableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func configure() {
        view.backgroundColor = .systemBackground
        configureClosetTableView()
    }

    func configureClosetTableView() {
        view.addSubview(closetTableView)
        closetTableView.rowHeight = 120
        closetTableView.separatorStyle = .none
        closetTableView.dataSource = self
        closetTableView.delegate = self
        closetTableView.register(ClosetItemCell.self, forCellReuseIdentifier: ClosetItemCell.reuseId)

        closetTableView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
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
}
