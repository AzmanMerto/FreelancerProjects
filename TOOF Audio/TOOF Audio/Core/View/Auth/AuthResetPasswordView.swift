//
//  AuthResetPasswordView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthResetPasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel : AuthViewModel = .init()
    
    var body: some View {
        ZStack {
            AuthBackground()
            VStack {
                CustomBackButton()
                    .padding(.top,90)
                Spacer()
                //MARK: AuthResetPasswordView - Header
                EntryHeader(title: TextHelper.auth.authResetPasswordTitle.rawValue,
                            description: TextHelper.auth.authResetPasswordDescription.rawValue)
                //MARK: AuthResetPasswordView - Textfield
                EntryTextField(isSecure: false,
                               isActive: (viewModel.mail.count > 0),
                               placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                               bindingText: $viewModel.mail)
                .padding(.vertical)
                Spacer()
                PrimaryButton(text: TextHelper.auth.authResetPasswordButton.rawValue, size: CGSize(width: 280, height: 48)) {
                    if viewModel.mail.isValidEmail() {
                        AuthManager.shared.resetPasswordWithMail(email: viewModel.mail){
                            dismiss()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct AuthResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AuthResetPasswordView()
    }
}
