//
//  AuthResetViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import Foundation

class AuthResetViewModel: ObservableObject {
    
    @Published var user = User()
    
    func resetPassword(completion: @escaping () -> ()){
        if ((user.mail?.isValidEmail()) != nil) {
            AuthManager.shared.resetPassword(userMail: user.mail!) {
                completion()
            }
        }
    }
    
}
