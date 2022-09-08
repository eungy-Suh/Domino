//
//  SuperSeedViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//

import UIKit

class SuperSeedViewController: UIViewController {
    
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "1234"
    }

private func setUI() {
    view.addSubview(tableView)
    
    tableView.dataSource = self
    tableView.rowHeight = 100
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .red
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell") //셀 등록

    NSLayoutConstraint.activate([
    tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100)
    ])
    
}
}

extension SuperSeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        }
    }
