//
//  RegisterViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var email: String
    @Published var name: String
    @Published var password: String
    @Published var againPassword: String
    @Published var isSamePassword: Bool
    
    init(email: String = "",
         name: String = "",
         password: String = "",
         againPassword: String = "",
         isSamePassword: Bool = false) {
        self.email = email
        self.name = name
        self.password = password
        self.againPassword = againPassword
        self.isSamePassword = isSamePassword
    }
}
