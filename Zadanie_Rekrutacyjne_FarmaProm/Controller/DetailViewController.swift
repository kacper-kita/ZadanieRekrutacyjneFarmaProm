//
//  DetailViewController.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 08/03/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: UserViewModel
    
    private lazy var detailView: DetailView = {
        let detailV = DetailView()
        return detailV
    }()
    
    init(data: UserViewModel) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    //MARK: Private functions
    
    private func setupView() {
        view.addSubview(detailView)
        view.backgroundColor = .white
        
        setupConstraints()
        setupData()
    }
    
    private func setupData() {
        detailView.userName.text = data.first + " " + data.last
        detailView.userPhone.text = data.phone
        detailView.userEmail.text = data.email
        detailView.userStreet.text = data.street
        detailView.userCity.text = data.city
        detailView.userState.text = data.state
        
        NetworkManager.shared.getImage(urlString: data.picture) { data in
            
            guard let image = data else {return}
            
            DispatchQueue.main.sync {
                self.detailView.userImage.image = UIImage(data: image)
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}
