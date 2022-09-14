//
//  ViewController.swift
//  Domino
//
//  Created by 서은지 on 2022/09/06.
//

import UIKit

class DominoViewController: UIViewController {
    
    let tableView = UITableView()
    let menu = ["슈퍼시드","프리미엄","클래식","사이드디시","음료","피클소스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        view.backgroundColor = .systemBackground
        setUI()
    }
    private func setUI() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier) //셀 등록
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.rowHeight = 100
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100)
        ])
    }
}
// MARK: -UITableViewDelegate
extension DominoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { fatalError() }
        cell.myImageView.image = UIImage(named: menu[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIImageView()
        headerView.image = UIImage(named:"logo")
        headerView.sizeToFit()
        tableView.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.widthAnchor.constraint(equalToConstant: 300),
            headerView.heightAnchor.constraint(equalToConstant: 270),
        ])
        return headerView
    }
}
extension DominoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let nextVC = SuperSeedViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }  else
        if indexPath.row == 1 {
            let next2VC = PrimiumViewController()
          self.navigationController?.pushViewController(next2VC, animated: true)
        } else
        if indexPath.row == 2 {
            let next3VC = ClassicTableViewController()
          self.navigationController?.pushViewController(next3VC, animated: true)
        }else
        if indexPath.row == 3 {
            let next4VC = SideTableViewController()
          self.navigationController?.pushViewController(next4VC, animated: true)
        }else
        if indexPath.row == 4 {
            let next5VC = DrinkTableViewController()
          self.navigationController?.pushViewController(next5VC, animated: true)
        }else
        if indexPath.row == 5 {
            let next6VC = SauceViewController()
          self.navigationController?.pushViewController(next6VC, animated: true)
        }
    }
}


