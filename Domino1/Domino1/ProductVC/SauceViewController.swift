//
//  SourceTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//

import UIKit

class SauceViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()

        let SauceMenu: [Product] = [
            Product(productTitle: "갈릭 디핑 소스", productImage:UIImage(named: "aa")!, productSubTitle: "500원"),
            Product(productTitle: "스위트 칠리소스", productImage:UIImage(named: "bb")!, productSubTitle: "500원"),
            Product(productTitle: "우리 피클L", productImage:UIImage(named: "cc")!, productSubTitle: "500원"),
            Product(productTitle: "우리 피클M", productImage:UIImage(named: "dd")!, productSubTitle: "500원"),
            Product(productTitle: "핫소스", productImage:UIImage(named: "ee")!, productSubTitle: "500원"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "피클/소스"
    }
}
//MARK: SauceDataSource,Delegate
extension SauceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SauceMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = SauceMenu[indexPath.row].productTitle
        cell.prodoctimageView.image = SauceMenu[indexPath.row].productImage
        cell.productSubTitle.text = SauceMenu[indexPath.row].productSubTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "갈릭 디핑 소스"
            nextVC.imageView.image = UIImage(named: "aa")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "스위트 칠리소스"
            nextVC.imageView.image = UIImage(named: "bb")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "우리 피클 L"
            nextVC.imageView.image = UIImage(named: "cc")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "우리 피클 M"
            nextVC.imageView.image = UIImage(named: "dd")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = DetailViewController()
            nextVC.title = "핫소스"
            nextVC.imageView.image = UIImage(named: "ee")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}

//MARK: SetUI
extension SauceViewController {
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
