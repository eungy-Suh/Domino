//
//  ViewController.swift
//  Domino
//
//  Created by 서은지 on 2022/09/06.
//

import UIKit

class DominoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let maintableView = UITableView()
    let menu = ["슈퍼시드","프리미엄","클래식","사이드디시"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        maintableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "MenuCell") //셀 등록
        maintableView.dataSource = self
        maintableView.backgroundColor = .brown
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell",
       for: indexPath) as? CustomTableViewCell else { fatalError()}
   //     cell.menuImageView.image = UIImage(named: menu[indexPath.row])
        return cell
    }
    private func setUI() {
        view.addSubview(maintableView)
        maintableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            maintableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            maintableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            maintableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            maintableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100)
            
        ])
    }
}
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let view = UIView()
//        let logoHeaderView = logoImageView()
//
//        view.addSubview(logoHeaderView)
//        logoHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            logoHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            logoHeaderView.widthAnchor.constraint(equalToConstant: 200),
//            logoHeaderView.heightAnchor.constraint(equalToConstant: 200),
//        ])
//        return view
//    }
//    func logoImageView() -> UIImageView {
//        let imgView = UIImageView()
//        imgView.image = UIImage(named: "logo")
//        imgView.contentMode = .scaleAspectFill
//        return imgView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }
//}
