//
//  AuthViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var isPressedForRegister: Bool
    @Published var mail: String
    @Published var password: String
    @Published var name: String
    @Published var code: String
    
    init(isPressedForRegister: Bool = false,
        mail: String = "",
         password: String = "",
         name: String = "",
         code: String = "") {
        self.isPressedForRegister = isPressedForRegister
        self.mail = mail
        self.password = password
        self.name = name
        self.code = code
    }
    
}
