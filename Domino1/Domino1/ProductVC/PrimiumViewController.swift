//
//  PrimiumViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//

import UIKit

class PrimiumViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
        let primiumPizza: [Product] = [
            Product(productTitle: "더블크러스트 이베리코", productImage: UIImage(named: "u")!, productSubTitle: "10,000원"),
            Product(productTitle: "와규 앤 비스테카", productImage: UIImage(named: "v")!, productSubTitle: "10,000원"),
            Product(productTitle: "블랙타이거 슈림프", productImage: UIImage(named: "x")!, productSubTitle: "10,000원"),
            Product(productTitle: "블랙앵거스 스테이크", productImage: UIImage(named: "y")!, productSubTitle: "10,000원"),
            Product(productTitle: "직화 스테이크", productImage: UIImage(named: "z")!, productSubTitle: "10,000원"),
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "프리미엄"
    }
}
//MARK: PrimiumDataSource,Delegate
extension PrimiumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primiumPizza.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = primiumPizza[indexPath.row].productTitle
        cell.prodoctimageView.image = primiumPizza[indexPath.row].productImage
        cell.productSubTitle.text = primiumPizza[indexPath.row].productSubTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "더블크러스트 이베리코"
            nextVC.imageView.image = UIImage(named: "u")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "와규 앤 비스테카"
            nextVC.imageView.image = UIImage(named: "v")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "블랙타이거 슈림프"
            nextVC.imageView.image = UIImage(named: "x")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "블랙앵거스 스테이크"
            nextVC.imageView.image = UIImage(named: "y")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = DetailViewController()
            nextVC.title = "직화 스테이크"
            nextVC.imageView.image = UIImage(named: "z")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}
//MARK: SetUI
extension PrimiumViewController {
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
