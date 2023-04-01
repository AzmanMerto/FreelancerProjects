//
//  AuthRegisterView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthRegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                AuthBackground()
                    .frame(width: UIScreen.main.bounds.width * 1)
                VStack {
                    Spacer()
                    //MARK: AuthRegisterView - Header
                    EntryHeader(title: TextHelper.auth.authRegisterTitle.rawValue,
                                description: TextHelper.auth.authRegisterDescription.rawValue)
                    .padding(.top,50)
                    //MARK: AuthRegisterView - Textfield
                    VStack {
                        EntryTextField(isSecure: false,
                                       isActive: (viewModel.name.count > 0),
                                       placeholderText: TextHelper.auth.authNameTextfieldPlaceholder.rawValue,
                                       bindingText: $viewModel.name)
                        EntryTextField(isSecure: false,
                                       isActive: (viewModel.mail.count > 0),
                                       placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                                       bindingText: $viewModel.mail)
                        .keyboardType(.emailAddress)
                        .padding(.vertical,20)
                        EntryTextField(isSecure: true,
                                       isActive: (viewModel.password.count > 0),
                                       placeholderText: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue,
                                       bindingText: $viewModel.password)
                        Text(TextHelper.auth.authPrivacyAndPolicy.rawValue.locale())
                            .foregroundColor(.ToofPlaceholder)
                            .font(.boldRounded14)
                            .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                    }
                    .padding(.vertical)
                    //MARK: AuthLoginView - Button
                    PrimaryButton(text: TextHelper.auth.authRegisterButton.rawValue,
                                  size: CGSize(width: 280, height: 48)) {
                        if viewModel.mail.isValidEmail() {
                            AuthManager.shared.register(name: viewModel.name, email: viewModel.mail, password: viewModel.password){
                                viewModel.isUserSuccessPassToMain = true
                            }
                        }
                    }.padding(.vertical)
                    Spacer()
                    //MARK: AuthLoginView - Roll to LoginView
                    HStack {
                        Text(TextHelper.auth.authLetsLogin.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                        Text(TextHelper.auth.authLetsLoginClick.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    .padding(.bottom)
                    .font(.boldRounded14.bold())
                    Spacer()
                }
                .navigationDestination(isPresented: $viewModel.isUserSuccessPassToMain) {
                    MainTabView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct AuthRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthRegisterView()
    }
}


