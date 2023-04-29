//
//  AuthLoginViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

class AuthLoginViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var isNavigateToRegister: Bool
    @Published var isNavigateToMain: Bool
    
    init(isNavigateToRegister: Bool = false,
         isNavigateToMain: Bool = false) {
        self.isNavigateToRegister = isNavigateToRegister
        self.isNavigateToMain = isNavigateToMain
    }
    
    //MARK: AuthLoginViewModel - Navigate to ResetPassword
    func navigateResetPasswordButton() -> some View {
        NavigationLink {
            AuthResetView()
                .hideNavigationBar()
        } label: {
            HStack {
                Spacer()
                Text(TextHelper.auth.authResetPassword.rawValue.locale())
                    .font(.default12)
                    .foregroundColor(.ToofTextColor)
            }
            .padding(.horizontal)
        }
    }
    //MARK: AuthLoginViewModel - Login
    func login() {
        if user.mail?.isValidEmail() != nil {
            AuthManager.shared.signIn(userMail: user.mail!, password: user.password ?? "") {
                self.isNavigateToMain.toggle()
            }
        }
    }
    
}
