//
//  SideTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//

import UIKit

class SideTableViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()

        let SideMenu: [Product] = [
            Product(productTitle: "딸기 슈크림", productImage:UIImage(named: "a")!, productSubTitle: "7,000원"),
            Product(productTitle: "슈퍼곡물 치킨", productImage:UIImage(named: "b")!, productSubTitle: "7,000원"),
            Product(productTitle: "애플 크러스트 디저트", productImage:UIImage(named: "c")!, productSubTitle: "7,000원"),
            Product(productTitle: "치킨퐁듀 그라탕", productImage:UIImage(named: "d")!, productSubTitle: "7,000원"),
            Product(productTitle: "퀴노아 치킨 샐러드", productImage:UIImage(named: "e")!, productSubTitle: "7,000원"),
            Product(productTitle: "포테이토 순살치킨", productImage:UIImage(named: "f")!, productSubTitle: "7,000원"),
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "사이드"
    }
}
//MARK: SideDataSource,Delegate
extension SideTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = SideMenu[indexPath.row].productTitle
        cell.prodoctimageView.image = SideMenu[indexPath.row].productImage
        cell.productSubTitle.text = SideMenu[indexPath.row].productSubTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "딸기 슈크림"
            nextVC.imageView.image = UIImage(named: "a")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "슈퍼곡물 치킨"
            nextVC.imageView.image = UIImage(named: "b")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "애플 크러스트 디저트"
            nextVC.imageView.image = UIImage(named: "c")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "치킨퐁듀 그라탕"
            nextVC.imageView.image = UIImage(named: "d")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = DetailViewController()
            nextVC.title = "퀴노아 치킨 샐러드"
            nextVC.imageView.image = UIImage(named: "e")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5 :
            let nextVC = DetailViewController()
            nextVC.title = "포테이토 순살치킨"
            nextVC.imageView.image = UIImage(named: "f")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}
//MARK: SetUI
extension SideTableViewController {
    private func setUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
