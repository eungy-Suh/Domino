//
//  ClassicTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//

import UIKit

class ClassicTableViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()

        let classPizza: [Product] = [
            Product(productTitle: "베이컨체더치즈", productImage:UIImage(named: "o")!, productSubTitle: "10,000원"),
            Product(productTitle: "불고기", productImage:UIImage(named: "p")!, productSubTitle: "10,000원"),
            Product(productTitle: "슈퍼디럭스", productImage:UIImage(named: "q")!, productSubTitle: "10,000원"),
            Product(productTitle: "슈퍼슈프림", productImage:UIImage(named: "r")!, productSubTitle: "10,000원"),
            Product(productTitle: "페퍼로니", productImage:UIImage(named: "s")!, productSubTitle: "10,000원"),
            Product(productTitle: "포테이토", productImage:UIImage(named: "t")!, productSubTitle: "10,000원"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "클래식"
    }
}
//MARK: ClassicDataSource,Delegate
extension ClassicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classPizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = classPizza[indexPath.row].productTitle
        cell.prodoctimageView.image = classPizza[indexPath.row].productImage
        cell.productSubTitle.text = classPizza[indexPath.row].productSubTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "베이컨체더치즈"
            nextVC.imageView.image = UIImage(named: "o")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "불고기"
            nextVC.imageView.image = UIImage(named: "p")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "슈퍼디럭스"
            nextVC.imageView.image = UIImage(named: "q")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "슈퍼슈프림"
            nextVC.imageView.image = UIImage(named: "r")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = DetailViewController()
            nextVC.title = "페퍼로니"
            nextVC.imageView.image = UIImage(named: "s")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5 :
            let nextVC = DetailViewController()
            nextVC.title = "포테이토"
            nextVC.imageView.image = UIImage(named: "t")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}

//MARK: SetUI
extension ClassicTableViewController {
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
