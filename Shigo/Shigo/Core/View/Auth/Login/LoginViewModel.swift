//
//  LoginViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    let userInfo : UserInfo
    var email : String
    var password : String
    
    init(userInfo: UserInfo = UserInfo(),
         email: String = UserInfo().email,
         password: String = UserInfo().password) {
        self.userInfo = userInfo
        self.email = email
        self.password = password
    }
}
