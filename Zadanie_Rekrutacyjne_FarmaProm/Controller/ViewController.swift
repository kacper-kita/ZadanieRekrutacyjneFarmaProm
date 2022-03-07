//
//  ViewController.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }


    private func setupView() {
        view.addSubview(mainView)
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

