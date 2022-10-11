//
//  DetailViewController.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/09.
//

import UIKit

class DetailViewController: UIViewController {
    var imageView = UIImageView()
    let downButton = UIButton(type: .custom)
    let upButton = UIButton(type: .custom)
    let centerLabel = UILabel()
    let stackView = UIStackView()
    var centerCount = 0
    
    let dataManager = DataManager.shared
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        stackUI()
        
        downButton.addTarget(self, action: #selector(downBtTapped(_:)), for: .touchUpInside)
        upButton.addTarget(self, action: #selector(upBtTapped(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "담기", style: .plain, target: self, action: #selector(addTappedButton(_:)))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let safeTitle = self.title else { return }
        print(safeTitle)
        centerLabel.text = String(dataManager.orderMenu[safeTitle] ?? 0) + "개"
    }
}
extension DetailViewController {
    @objc func downBtTapped(_ sender: UIButton) {
        if centerCount > 0 {
            centerCount -= 1
            centerLabel.text = String(centerCount)+"개"
        }
    }
    @objc func upBtTapped(_ sender: UIButton) {
        centerCount += 1
        centerLabel.text = String(centerCount)+"개"
    }
    @objc func addTappedButton(_ sender: UIButton) {
        if centerCount > 0 {
            guard let orderItem = self.title else {return}
            dataManager.orderMenu[orderItem] = centerCount
            dataManager.orderMenuKey = Array(dataManager.orderMenu.keys)
            dataManager.orderMenuValue = Array(dataManager.orderMenu.values)
            print(dataManager.orderMenu)
            }
        }
    }
extension DetailViewController {
    
    func stackUI() {
        centerLabel.text = "0개"
        centerLabel.textColor = .white
        centerLabel.backgroundColor = .gray
        centerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        centerLabel.textAlignment = .center
        
        upButton.setTitle("+", for: .normal)
        downButton.setTitle("-", for: .normal)
        
        [upButton, downButton].forEach{
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.setTitleColor(.gray, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        }
    }
    func setUI() {
        view.addSubview(
            imageView)
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 0
        
        
        [downButton,centerLabel,upButton].forEach{
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.backgroundColor = .orange
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo:
                                            imageView.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            
            downButton.widthAnchor.constraint(equalToConstant: 50),
            upButton.widthAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}


