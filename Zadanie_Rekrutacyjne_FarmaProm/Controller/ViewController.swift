//
//  ViewController.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = UserListViewModel()
    
    private lazy var mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupView()
        fetchUsers()
    }


    private func setupView() {
        view.addSubview(mainView)
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func fetchUsers() {
        viewModel.getUsers { (_) in
            self.mainView.tableView.reloadData()
        }
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainViewCell") as! MainTableViewCell
        
        let user = viewModel.userVM[indexPath.row]
        
        cell.firstNameLabel.text = user.first
        cell.lastNameLabel.text = user.last
        NetworkManager.shared.getImage(urlString: user.picture) { data in
            
            guard let image = data else {return}
            
            DispatchQueue.main.sync {
                   cell.userImage.image = UIImage(data: image)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

