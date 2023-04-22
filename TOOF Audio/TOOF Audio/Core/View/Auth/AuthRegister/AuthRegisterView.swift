//
//  AuthRegisterView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct AuthRegisterView: View {
    
    @ObservedObject var viewModel = AuthRegisterViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            authBackground()
            VStack {
                //MARK: AuthRegisterView - Header
                authHeader(title: TextHelper.auth.authRegisterTitle.rawValue,
                           description: TextHelper.auth.authRegisterDescription.rawValue)
                //MARK: AuthRegisterView - Mail
                ToofTextField(textField: Binding(
                    get: {  viewModel.user.mail ?? "" },
                    set: {viewModel.user.mail = $0  }),
                              placeholder: TextHelper.auth.authMailTextFieldPlaceholder.rawValue)
                .padding(.vertical)
                //MARK: AuthRegisterView - Name
                ToofTextField(textField: Binding(
                    get: {  viewModel.user.name ?? "" },
                    set: {viewModel.user.name = $0  }),
                              placeholder: TextHelper.auth.authNameTextfieldPlaceholder.rawValue)
                //MARK: AuthRegisterView - Password
                ToofTextField(textField: Binding(
                    get: {  viewModel.user.password ?? "" },
                    set: {viewModel.user.password = $0  }),
                              isSecure: true,
                              placeholder: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue)
                .padding(.vertical)
                Spacer()
                //MARK: AuthRegisterView - Button
                ToofButton(buttonText: TextHelper.auth.authRegisterButton.rawValue) {
                    viewModel.register()
                }
                Spacer()
                //MARK: AuthRegisterView - Navigate
                authSwitchAuthButton(text: TextHelper.auth.authLetsLogin.rawValue, altText: TextHelper.auth.authLetsLoginClick.rawValue) {
                    dismiss()
                }
                .padding(.bottom)
            }
            .fullScreenCover(isPresented: $viewModel.isUserRegistered) {
                MainTabView()
                    .hideNavigationBar()
            }
        }
    }
}

struct AuthRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthRegisterView()
    }
}
