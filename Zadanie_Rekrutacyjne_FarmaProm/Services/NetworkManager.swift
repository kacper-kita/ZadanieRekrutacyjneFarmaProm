//
//  NetworkManager.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    let apiURL = "https://api.randomuser.me/?results=500&key=0A4F-FC2E-5C76-5678&seed=rekrutacja2022"
    let imageCache = NSCache<NSString, NSData>()
    
    //MARK: Functions
    
    public func getUsers(completion: @escaping (Users?) -> Void ) {
        guard let url = URL(string: apiURL) else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let users = try? JSONDecoder().decode(Users.self, from: data)
            users == nil ? completion(nil) : completion(users)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
    
                completion(data)
                
            }.resume()
        }
    }
    

