//
//  LoginViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email : String
    @Published var password : String
    
    init(email: String = "",
         password: String = "") {
        self.email = email
        self.password = password
    }
}
