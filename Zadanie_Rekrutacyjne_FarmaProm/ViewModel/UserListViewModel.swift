//
//  UserListViewModel.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation

class UserListViewModel {
    var userVM = [UserViewModel]()
    let imageCache = NSCache<NSString, NSData>()
    
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
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
    }
}
