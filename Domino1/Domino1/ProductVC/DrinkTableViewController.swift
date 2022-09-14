//
//  DrinkTableViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//
import UIKit

class DrinkTableViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
    struct Product {
       var productTitle: String
       var productImage: UIImage
       var productSubTitle: String
   }
    let DrinkMenu: [Product] = [
        Product(productTitle: "미닛메이드", productImage:UIImage(named: "미닛메이드 스파클링 청포도")!, productSubTitle: "3,000원"),
        Product(productTitle: "스프라이트", productImage:UIImage(named: "스프라이트")!, productSubTitle: "3,000원"),
        Product(productTitle: "코카콜라 제로", productImage:UIImage(named: "코카콜라 제로")!, productSubTitle: "3,000원"),
        Product(productTitle: "코카콜라", productImage:UIImage(named: "코카콜라")!, productSubTitle: "3,000원"),

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        navigationItem.title = "드링크"
    }
}
//MARK: DrinkDataSource,Delegate
extension DrinkTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DrinkMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.productTitle.text = DrinkMenu[indexPath.row].productTitle
        cell.prodoctimageView.image = DrinkMenu[indexPath.row].productImage
        cell.productSubTitle.text = DrinkMenu[indexPath.row].productSubTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let nextVC = DetailViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            nextVC.title = "미닛메이드"
            DetailViewController.imageView.image = UIImage(named: "미닛메이드")
        case 1 :
            let nextVC = DetailViewController()
            nextVC.title = "스프라이트"
            DetailViewController.imageView.image = UIImage(named: "스프라이트")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = DetailViewController()
            nextVC.title = "코카콜라 제로"
            DetailViewController.imageView.image = UIImage(named: "코카콜라 제로")
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = DetailViewController()
            nextVC.title = "코카콜라"
            DetailViewController.imageView.image = UIImage(named: "코카콜라")
            self.navigationController?.pushViewController(nextVC, animated: true)

        default:
            break
        }
    }
}
//MARK: SetUI
extension DrinkTableViewController {
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
