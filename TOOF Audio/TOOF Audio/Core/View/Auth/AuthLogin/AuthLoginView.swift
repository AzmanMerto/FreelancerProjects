//
//  AuthLoginView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct AuthLoginView: View {
    
    @ObservedObject var viewModel = AuthLoginViewModel()
    
    var body: some View {
        ZStack {
            authBackground()
            VStack {
                //MARK: AuthLoginView - Header
                authHeader(title: TextHelper.auth.authLoginTitle.rawValue,
                           description: TextHelper.auth.authLoginDescription.rawValue)
                //MARK: AuthLoginView - Textfield mail
                ToofTextField(textField: Binding(get: { viewModel.user.mail ?? "" },
                                                 set: { viewModel.user.mail = $0 }
                ), placeholder: TextHelper.auth.authMailTextFieldPlaceholder.rawValue)
                .keyboardType(.emailAddress)
                .padding(.vertical)
                //MARK: AuthLoginView - Textfield password
                ToofTextField(textField: Binding(get: { viewModel.user.password ?? "" },
                                                 set: { viewModel.user.password = $0 }
                                                ),
                              isSecure: true,
                              placeholder: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue)
           
                viewModel.navigateResetPasswordButton()
                Spacer()
                //MARK: AuthLoginView - Button
                ToofButton(buttonText: TextHelper.auth.authLoginButton.rawValue) {  viewModel.login();  print("Login Check \n Email:\(viewModel.user.mail ?? "NoMail") \n Password: \(viewModel.user.password ?? "NoPass")")}
                Spacer()
                //MARK: AuthLoginView - Navigate
                ZStack {
                    
                    NavigationLink(isActive: $viewModel.isNavigateToRegister) {
                        AuthRegisterView()
                            .hideNavigationBar()
                    } label: {  }

                    authSwitchAuthButton(text: TextHelper.auth.authLetsLogin.rawValue,
                                         altText: TextHelper.auth.authLetsLoginClick.rawValue) {
                        viewModel.isNavigateToRegister.toggle()
                    }
                }
                .padding(.bottom)
            }
            .fullScreenCover(isPresented: $viewModel.isNavigateToMain) {
                MainTabView()
            }
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginView()
    }
}
