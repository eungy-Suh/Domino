//
//  SuperSeedViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//

import UIKit

class SuperSeedViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
        let SuperSeedPizza: [Product] = [
            Product(productTitle: "우리 고구마", productImage: UIImage(named: "g")!, productSubTitle: "10,000원"),
            Product(productTitle: "콰트로 치즈 퐁듀", productImage: UIImage(named: "h")!, productSubTitle: "10,000원"),
            Product(productTitle: "알로하 하와이안", productImage: UIImage(named: "i")!, productSubTitle: "10,000원"),
            Product(productTitle: "글램핑 바비큐", productImage: UIImage(named: "j")!, productSubTitle: "10,000원")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "슈퍼시드"
    }
}
//MARK: SuperSeedDataSource,Delegate
extension SuperSeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SuperSeedPizza.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = SuperSeedPizza[indexPath.row].productTitle
        cell.prodoctimageView.image = SuperSeedPizza[indexPath.row].productImage
        cell.productSubTitle.text = SuperSeedPizza[indexPath.row].productSubTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "우리 고구마"
            nextVC.imageView.image = UIImage(named: "g")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "콰트로 치즈 퐁듀"
            nextVC.imageView.image = UIImage(named: "h")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "알로하 하와이안"
            nextVC.imageView.image = UIImage(named: "i")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "글램핑 바비큐"
            nextVC.imageView.image = UIImage(named: "j")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}
//MARK: SetUI
extension SuperSeedViewController {
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
