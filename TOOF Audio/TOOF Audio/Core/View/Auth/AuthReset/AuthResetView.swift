//
//  AuthResetView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct AuthResetView: View {
    
    @ObservedObject var viewModel = AuthResetViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            authBackground()
            VStack {
                //MARK: AuthResetView - Header
                authHeader(isShowBackButton: true,
                           title: TextHelper.auth.authResetPasswordTitle.rawValue,
                           description: TextHelper.auth.authResetPasswordDescription.rawValue)
                .padding(.top)
                //MARK: AuthResetView - TextField
                ToofTextField(textField: Binding(get: { viewModel.user.mail ?? "" },
                                                 set: { viewModel.user.mail = $0 }),
                              placeholder: TextHelper.auth.authMailTextFieldPlaceholder.rawValue)
                .padding(.vertical)
                Spacer()
                //MARK: AuthResetView - Button
                ToofButton(buttonText: TextHelper.auth.authResetPassword.rawValue) {
                    viewModel.resetPassword {    dismiss()    }
                }
                Spacer()
            }
        }
    }
}

struct AuthResetView_Previews: PreviewProvider {
    static var previews: some View {
        AuthResetView()
    }
}
