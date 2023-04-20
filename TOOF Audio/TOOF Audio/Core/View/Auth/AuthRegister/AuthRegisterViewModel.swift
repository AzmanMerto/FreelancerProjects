//
//  AuthRegisterViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import Foundation

class AuthRegisterViewModel: ObservableObject {
    
    @Published var user = User(mail: "", name: "", password: "")
    @Published var isUserRegistered: Bool

    init(isUserRegistered: Bool = false) {
        self.isUserRegistered = isUserRegistered
    }
    
    func register() {
        if ((user.mail?.isValidEmail()) != nil) {
            guard let name = user.name, user.password?.count ?? 0 > 5 else { return }
            AuthManager.shared.register(userMail: user.mail!, userName: name, userPassword: user.password!) {
                self.isUserRegistered.toggle()
            }
        }
    }
}
