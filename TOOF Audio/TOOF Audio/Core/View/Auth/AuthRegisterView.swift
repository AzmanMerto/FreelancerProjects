//
//  AuthRegisterView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthRegisterView: View {
    
    @ObservedObject var viewModel: AuthViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: AuthRegisterView - Header
                EntryHeader(title: TextHelper.auth.authRegisterTitle.rawValue,
                            description: TextHelper.auth.authRegisterDescription.rawValue)
                //MARK: AuthRegisterView - Textfield
                VStack {
                    EntryTextField(isSecure: false,
                                   isActive: false,
                                   placeholderText: TextHelper.auth.authNameTextfieldPlaceholder.rawValue,
                                   bindingText: $viewModel.name)
                    EntryTextField(isSecure: false,
                                   isActive: false,
                                   placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                                   bindingText: $viewModel.mail)
                    .padding(.vertical,20)
                    EntryTextField(isSecure: true,
                                   isActive: false,
                                   placeholderText: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue,
                                   bindingText: $viewModel.password)
                    
                    Text(TextHelper.auth.authPrivacyAndPolicy.rawValue.locale())
                        .foregroundColor(.ToofPlaceholder)
                        .font(.boldRounded14)
                        .padding(.top)
                }
                .padding(.vertical)
                PrimaryButton(text: TextHelper.auth.authRegisterButton.rawValue,
                              size: CGSize(width: 280, height: 48)) {
                    
                }.padding(.vertical)
                Spacer()
                HStack {
                    Text(TextHelper.auth.authLetsLogin.rawValue.locale())
                        .foregroundColor(.ToofTextColor)
                    Text(TextHelper.auth.authLetsLoginClick.rawValue.locale())
                        .foregroundColor(.ToofButtonColor)
                        .onTapGesture {
                            print("RESPONSE: Navigate to Register")
                            coordinator.pop()
                        }
                }
                Spacer()
            }
        }
    }
}

struct AuthRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthRegisterView()
    }
}
