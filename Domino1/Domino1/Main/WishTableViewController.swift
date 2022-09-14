//
//  WishTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//
import UIKit

class WishTableViewController: UIViewController {
    
    let wishTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        let cancelBarButtonItem = UIBarButtonItem(title: "목록지우기", style: .plain, target: self, action: #selector(leftTabBarButtonItem(_:)))
        let orderBarButtonItem = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(rightTabBarButtonItem(_:)))
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = orderBarButtonItem
    }
}
extension WishTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (wishTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell)
        return cell
        
    }
}
//MARK: WishAction
extension WishTableViewController {
    @objc func leftTabBarButtonItem(_ sender: UIButton) {
        
    }
}
extension WishTableViewController {
    @objc func rightTabBarButtonItem(_ sender: UIButton) {
    }
}
extension WishTableViewController : UITableViewDelegate {
    private func setUI() {
        view.addSubview(wishTableView)
        wishTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        wishTableView.rowHeight = 100
        wishTableView.delegate = self
        wishTableView.dataSource = self
        wishTableView.backgroundColor = .systemBackground
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wishTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wishTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wishTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
