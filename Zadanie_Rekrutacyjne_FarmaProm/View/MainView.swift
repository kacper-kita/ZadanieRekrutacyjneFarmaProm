//
//  MainView.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation
import UIKit

final class MainView: UIView {
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Contacts"
        label.font = UIFont(name: "Rockwell", size: 26)
        
        return label
    }()
    
     lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "My contacts list"
        label.font = UIFont(name: "Rockwell", size: 18)
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.register(MainTableViewCell.self, forCellReuseIdentifier: "mainViewCell")
        
        return tableV
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    private func setupView() {
        addSubview(mainLabel)
        addSubview(subTitleLabel)
        addSubview(tableView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            mainLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 30),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
