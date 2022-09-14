//
//  ClassicTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//

import UIKit

class ClassicTableViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
    struct Product {
       var productTitle: String
       var productImage: UIImage
       var productSubTitle: String
   }
        let classPizza: [Product] = [
            Product(productTitle: "베이컨체더치즈", productImage:UIImage(named: "베이컨체더치즈")!, productSubTitle: "10,000원"),
            Product(productTitle: "불고기", productImage:UIImage(named: "불고기")!, productSubTitle: "10,000원"),
            Product(productTitle: "슈퍼디럭스", productImage:UIImage(named: "슈퍼디럭스")!, productSubTitle: "10,000원"),
            Product(productTitle: "슈퍼슈프림", productImage:UIImage(named: "슈퍼슈프림")!, productSubTitle: "10,000원"),
            Product(productTitle: "페퍼로니", productImage:UIImage(named: "페퍼로니")!, productSubTitle: "10,000원"),
            Product(productTitle: "포테이토", productImage:UIImage(named: "포테이토")!, productSubTitle: "10,000원"),
            
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
            DetailViewController.imageView.image = UIImage(named: "베이컨체더치즈")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "불고기"
            DetailViewController.imageView.image = UIImage(named: "불고기")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "슈퍼디럭스"
            DetailViewController.imageView.image = UIImage(named: "슈퍼디럭스")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "슈퍼슈프림"
            DetailViewController.imageView.image = UIImage(named: "슈퍼슈프림")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = DetailViewController()
            nextVC.title = "페퍼로니"
            DetailViewController.imageView.image = UIImage(named: "페퍼로니")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5 :
            let nextVC = DetailViewController()
            nextVC.title = "포테이토"
            DetailViewController.imageView.image = UIImage(named: "포테이토")
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
