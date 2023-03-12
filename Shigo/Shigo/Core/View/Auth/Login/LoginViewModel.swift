//
//  LoginViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    var email : String
    var password : String
    var isLoggedIn: Bool
    
    init(email: String = "",
         password: String = "",
         isLoggedIn: Bool = false) {
        self.email = email
        self.password = password
        self.isLoggedIn = isLoggedIn
    }
}
