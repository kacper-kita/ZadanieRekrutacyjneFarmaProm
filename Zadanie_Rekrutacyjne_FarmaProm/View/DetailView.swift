//
//  DetailView.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 08/03/2022.
//

import Foundation
import UIKit

final class DetailView: UIView {
    
    //MARK: Setup view
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 1.0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 170 / 2
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Rockwell", size: 26)
        
        return label
    }()
    
    lazy var userPhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var userEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var userStreet: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var userCity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var userState: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var userPhoneTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Phone number"
        label.font = UIFont(name: "Arial", size: 18)
        
        return label
    }()
    
    private lazy var userEmailTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Email address"
        label.font = UIFont(name: "Arial", size: 18)
        
        return label
    }()
    
    private lazy var userLocationTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Location"
        label.font = UIFont(name: "Arial", size: 18)
        
        return label
    }()
    
    private lazy var streetTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "STREET"
        label.font = UIFont(name: "Arial", size: 12)
        
        return label
    }()
    
    private lazy var cityTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "CITY"
        label.font = UIFont(name: "Arial", size: 12)
        
        return label
    }()
    
    private lazy var stateTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "STATE"
        label.font = UIFont(name: "Arial", size: 12)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var streetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var stateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    //MARK: Private functions
    
    private func setupView() {
        addSubview(userImage)
        addSubview(userName)
        addSubview(userPhone)
        addSubview(userEmail)
        addSubview(userPhoneTitle)
        addSubview(userEmailTitle)
        addSubview(userLocationTitle)
        addSubview(stackView)
        stackView.addArrangedSubview(streetStackView)
        stackView.addArrangedSubview(cityStackView)
        stackView.addArrangedSubview(stateStackView)
        streetStackView.addArrangedSubview(streetTitle)
        streetStackView.addArrangedSubview(userStreet)
        cityStackView.addArrangedSubview(cityTitle)
        cityStackView.addArrangedSubview(userCity)
        stateStackView.addArrangedSubview(stateTitle)
        stateStackView.addArrangedSubview(userState)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 170),
            userImage.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        NSLayoutConstraint.activate([
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 28),
            userName.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            userPhoneTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userPhoneTitle.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            userPhone.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            userPhone.topAnchor.constraint(equalTo: userPhoneTitle.bottomAnchor, constant: 10),
            userPhone.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userEmailTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userEmailTitle.topAnchor.constraint(equalTo: userPhone.bottomAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            userEmail.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            userEmail.topAnchor.constraint(equalTo: userEmailTitle.bottomAnchor, constant: 10),
            userEmail.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLocationTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userLocationTitle.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: userLocationTitle.bottomAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            
        ])
    }
}
