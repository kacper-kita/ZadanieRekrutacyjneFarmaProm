//
//  MainTableViewCell.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation
import UIKit

final class MainTableViewCell: UITableViewCell {
    
    var favID:Int = 0
    
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
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?.withRenderingMode(.alwaysTemplate), for: .selected)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(starAction), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        updateSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSelection() {
        let key = "\(favID)"
        let userDefault = UserDefaults.standard
        let isFav = userDefault.bool(forKey: key)
        favoriteButton.isSelected = isFav
    }
    
    @objc func starAction() {
        favoriteButton.isSelected = !favoriteButton.isSelected
        let key = "\(favID)"
        let userDefault = UserDefaults.standard
        userDefault.set(favoriteButton.isSelected, forKey: key)
        userDefault.synchronize()
    }
    
    private func setupView() {
        addSubview(userImage)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        contentView.addSubview(favoriteButton)

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
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: topAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            favoriteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
}

