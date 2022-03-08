//
//  UserListViewModel.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation

class UserListViewModel {
    var userVM = [UserViewModel]()
    
    func getUsers(completion: @escaping ([UserViewModel]) -> Void) {
        NetworkManager.shared.getUsers { users in
            guard let users = users else {
                return
            }
            
            let userVM = users.results.map(UserViewModel.init)
            DispatchQueue.main.async {
                self.userVM = userVM.sorted(by: {$0.last < $1.last})
                completion(userVM)
            }
        }
    }
}
