//
//  AuthViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var isPressedForRegister: Bool
    @Published var isResetPassword: Bool
    @Published var isUserSuccessPassToMain: Bool
    @Published var mail: String
    @Published var password: String
    @Published var againPassword: String
    @Published var name: String
    @Published var code: String
    
    init(isPressedForRegister: Bool = false,
         isResetPassword: Bool = false,
         isUserSuccessPassToMain: Bool = false,
         mail: String = "",
         password: String = "",
         againPassword: String = "",
         name: String = "",
         code: String = "") {
        self.isPressedForRegister = isPressedForRegister
        self.isResetPassword = isResetPassword
        self.isUserSuccessPassToMain = isUserSuccessPassToMain
        self.mail = mail
        self.password = password
        self.againPassword = againPassword
        self.name = name
        self.code = code
    }
    
}
