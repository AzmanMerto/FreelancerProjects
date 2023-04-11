//
//  AuthLoginView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthLoginView: View {
    
    @ObservedObject var viewModel : AuthViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                AuthBackground()
                VStack {
                    Spacer()
                    //MARK: AuthLoginView - Header
                    EntryHeader(title: TextHelper.auth.authLoginTitle.rawValue,
                                description: TextHelper.auth.authLoginDescription.rawValue)
                    .padding(.all)
                    //MARK: AuthLoginView - Textfields & reset password
                    VStack {
                        EntryTextField(isSecure: false,
                                       isActive: (viewModel.mail.count > 0),
                                       placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                                       bindingText: $viewModel.mail)
                        .padding(.bottom)
                        EntryTextField(isSecure: true,
                                       isActive: (viewModel.password.count > 0),
                                       placeholderText: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue,
                                       bindingText: $viewModel.password)
                        HStack {
                            Spacer()
                            Text(TextHelper.auth.authResetPassword.rawValue.locale())
                                .font(.boldRounded14)
                                .foregroundColor(.ToofTextColor)
                        }
                        .onTapGesture {
                            viewModel.isResetPassword.toggle()
                        }
                        .padding(.trailing)
                    }
                    .padding(.all)
                    //MARK: AuthLoginView - Buttons
                    PrimaryButton(text: TextHelper.auth.authLoginButton.rawValue,
                                  size: CGSize(width: 280, height: 48)) {
                        if viewModel.mail.isValidEmail() && viewModel.password.count > 5 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + LOADING_TIME_MED) {
                                AuthManager.shared.login(email: viewModel.mail, password: viewModel.password){
                                    viewModel.isUserSuccessPassToMain.toggle()
                                }
                            }
                        }
                    }
                                  .padding(.vertical)
                    Spacer()
                    //MARK: AuthLoginView - Roll to RegisterView
                    HStack {
                        Text(TextHelper.auth.authLetsRegister.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                        Text(TextHelper.auth.authLetsRegisterClick.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                            .onTapGesture {
                                DispatchQueue.main.asyncAfter(deadline: .now() + LOADING_TIME_MIN) {
                                    viewModel.isPressedForRegister.toggle()
                                }
                            }
                    }
                    .font(.boldRounded14.bold())
                    .padding(.bottom)
                    Spacer()
                }
                .fullScreenCover(isPresented: $viewModel.isResetPassword) {
                    AuthResetPasswordView()
                }
                .navigationDestination(isPresented: $viewModel.isPressedForRegister) {
                    AuthRegisterView()
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $viewModel.isUserSuccessPassToMain) {
                    MainTabView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginView()
    }
}
