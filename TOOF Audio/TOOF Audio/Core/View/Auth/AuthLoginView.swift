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
                        let mailStatus = (viewModel.mail.count > 0)
                        EntryTextField(isSecure: false,
                                       isActive: mailStatus,
                                       placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                                       bindingText: $viewModel.mail)
                        .padding(.bottom)
                        let passwordStatus = (viewModel.password.count > 0)
                        EntryTextField(isSecure: true,
                                       isActive: passwordStatus,
                                       placeholderText: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue,
                                       bindingText: $viewModel.mail)
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
                        //Action Login User
                    }.padding(.vertical)
                    Spacer()
                    //MARK: AuthLoginView - Roll to RegisterView
                    HStack {
                        Text(TextHelper.auth.authLetsRegister.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                        Text(TextHelper.auth.authLetsRegisterClick.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                            .onTapGesture {
                                print("RESPONSE: Navigate to Register")
                                viewModel.isPressedForRegister.toggle()
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
            }
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginView()
    }
}
