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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wishTableView.reloadData()
    }
}

extension WishTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.orderMenu.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (wishTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell)
        
        cell.productTitle.text = DataManager.shared.orderMenuKey[indexPath.row]
        cell.productSubTitle.text = "주문수량 : \(String(DataManager.shared.orderMenuValue[indexPath.row]))"
        cell.prodoctimageView.image = UIImage(named: DataManager.shared.orderMenuKey[indexPath.row])
        return cell
        
    }
}

//MARK: WishAction
extension WishTableViewController {
    @objc func leftTabBarButtonItem(_ sender: UIButton) {
        let alertController = UIAlertController(title: "경고", message: "목록을 지우시겠습니까.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { UIAlertAction in
            
            DataManager.shared.orderMenu = [:]
            self.wishTableView.reloadData()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

extension WishTableViewController {
    @objc func rightTabBarButtonItem(_ sender: UIButton) {
        var menuList = ""
        var totalPrice = 0
        for (key, value) in DataManager.shared.orderMenu {
            print("key -\(key), value -\(value)")
            menuList += "\(key) - \(value)\n"
            guard let count = DataManager.shared.orderMenu[key] else {return}//갯수
            guard let price = DataManager.shared.menuPrice[key] else {return}//가격
            let totalPrice1 = count * price
            totalPrice += totalPrice1
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: totalPrice as NSNumber) ?? ""
        let alertController = UIAlertController(title: "결제내역", message: "\(menuList)\n 주문금액: \(result)원", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "돌아가기", style: .cancel)
        let confirmAction = UIAlertAction(title: "결제하기", style: .default) { UIAlertAction in
            DataManager.shared.orderMenu = [:]
            self.wishTableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

extension WishTableViewController : UITableViewDelegate {
    private func setUI() {
        view.addSubview(wishTableView)
        wishTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        wishTableView.rowHeight = 120
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
