//
//  MainTableViewCell.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation
import UIKit

final class MainTableViewCell: UITableViewCell {
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(userImage)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            userImage.topAnchor.constraint(equalTo: topAnchor),
            userImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            firstNameLabel.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 30),
            firstNameLabel.topAnchor.constraint(equalTo: topAnchor),
            firstNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.leftAnchor.constraint(equalTo: firstNameLabel.rightAnchor, constant: 10),
            lastNameLabel.topAnchor.constraint(equalTo: topAnchor),
            lastNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            lastNameLabel.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
}

