//
//  MainTableViewCell.swift
//  Domino
//
//  Created by 서은지 on 2022/09/06.
//
import UIKit

class CustomTableViewCell: UITableViewCell {

    
let menuImageView = UIImageView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(menuImageView)
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            menuImageView.widthAnchor.constraint(equalToConstant: 400),
            menuImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
