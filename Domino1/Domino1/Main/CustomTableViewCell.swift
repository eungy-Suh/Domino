//
//  CustomTableViewCell.swift
//  Domino1
//
//  Created by 서은지 on 2022/09/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "mainCell"
    
    let myImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myImageView)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
