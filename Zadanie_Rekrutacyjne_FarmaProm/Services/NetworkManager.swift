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
    
    //MARK: Functions
    
    //function to download the contact list from the API
    public func getUsers(completion: @escaping (Users?) -> Void ) {
        guard let url = URL(string: apiURL) else {return}
        
        /*
         Validate if there is already a saved file with the downloaded user list.
         If it does not exist it is retrieved and saved to the file "userData.json" and then decoded.
         */
        if self.readFromFile(filename: "userData.json") != nil {
            guard let userData = self.readFromFile(filename: "userData.json") else {return}

            let users = try? JSONDecoder().decode(Users.self, from: userData)
            users == nil ? completion(nil) : completion(users)
        }else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.saveToLocalFile(userData: data, filename: "userData.json")
                
                let users = try? JSONDecoder().decode(Users.self, from: data)
                users == nil ? completion(nil) : completion(users)
                
            }.resume()    
        }
    }
    
    //image retrieval function
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
    
    //MARK: Functions for local file management
    
    func saveToLocalFile(userData: Data, filename: String) {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent(filename)
            try userData.write(to: fileURL, options: .atomic)
        } catch { }
    }
    
    func readFromFile(filename: String) -> Data? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let filePath = documentsURL.appendingPathComponent(filename).path
            if FileManager.default.fileExists(atPath: filePath), let data = FileManager.default.contents(atPath: filePath) {
                return data
            }
            return nil
    }
    
    func deleteLocalFile(filename: String) {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent(filename)
            try FileManager.default.removeItem(at: fileURL)
        } catch { }
    }
}
    

