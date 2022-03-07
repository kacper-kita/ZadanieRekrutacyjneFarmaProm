//
//  UserModel.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation

//// MARK: - Users
//struct Users: Decodable {
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Decodable {
//    let name: Name
//    let location: Location
//    let email: String
//    let phone, cell: String
//    let picture: Picture
//}
//
//// MARK: - Location
//struct Location: Decodable {
//    let street, city, state, postcode: String
//}
//
//// MARK: - Name
//struct Name: Decodable {
//    let title, first, last: String
//}
//
//// MARK: - Picture
//struct Picture: Decodable {
//    let large, medium, thumbnail: String
//}

struct Users: Decodable {
    let results: [User]
}

struct User: Decodable {

    let name: Name
    let email: String
    let phone, cell: String
    let picture: Picture
    let location: Location

    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }

    struct Picture: Decodable {
        let large, medium, thumbnail: String
    }
    
    struct Location: Decodable {
        let street: Street
        let city, state: String
    }
    
    struct Street: Decodable {
        let number: Int
        let name: String
    }
}
