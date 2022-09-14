//
//  ProductTableViewCell.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/08.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "productCell"
    
    let productTitle = UILabel()
    let productSubTitle = UILabel()
    let prodoctimageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        productTitle.font = UIFont.boldSystemFont(ofSize: 20)
        productSubTitle.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(prodoctimageView)
        self.addSubview(productTitle)
        self.addSubview(productSubTitle)
        prodoctimageView.translatesAutoresizingMaskIntoConstraints = false
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productSubTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prodoctimageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            prodoctimageView.heightAnchor.constraint(equalToConstant: 120),
            prodoctimageView.widthAnchor.constraint(equalToConstant: 120),
            prodoctimageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            productTitle.leadingAnchor.constraint(equalTo:prodoctimageView.trailingAnchor, constant: 20),
            productTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            productSubTitle.leadingAnchor.constraint(equalTo:prodoctimageView.trailingAnchor, constant: 20),
            productSubTitle.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 5),

        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
