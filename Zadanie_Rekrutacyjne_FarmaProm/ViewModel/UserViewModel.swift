//
//  UserViewModel.swift
//  Zadanie_Rekrutacyjne_FarmaProm
//
//  Created by Kacper Kita on 07/03/2022.
//

import Foundation

struct UserViewModel {
    let user: User
    
    var first: String {
        return user.name.first
    }
    
    var last: String {
        return user.name.last
    }
    
    var email: String {
        return user.email
    }
    
    var phone: String {
        return user.phone
    }
    
    var picture: String {
        return user.picture.large
    }
    
    var street: String {
        return user.location.street.name + " " + String(user.location.street.number)
    }

    var state: String {
        return user.location.state
    }

    var city: String {
        return user.location.city
    }
    
}
