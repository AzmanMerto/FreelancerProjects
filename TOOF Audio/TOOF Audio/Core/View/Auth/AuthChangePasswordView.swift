//
//  AuthChangePasswordView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

//struct AuthChangePasswordView: View {
//
//    @ObservedObject var viewModel : AuthViewModel = .init()
//
//    var body: some View {
//        ZStack {
//            AuthBackground()
//            VStack {
//                CustomBackButton()
//                    .padding(.top,90)
//                EntryHeader(title: TextHelper.auth.authChangePasswordTitle.rawValue ,
//                            description: TextHelper.auth.authChangePasswordDescription.rawValue)
//                EntryTextField(isSecure: false,
//                               isActive: (viewModel.password.count > 0),
//                               placeholderText: TextHelper.auth.authChangePasswordTextfieldPlaceholder.rawValue,
//                               bindingText: $viewModel.password)
//                .padding(.vertical)
//                EntryTextField(isSecure: false,
//                               isActive: (viewModel.againPassword.count > 0),
//                               placeholderText: TextHelper.auth.authConfirmPasswordTextfieldPlaceholder.rawValue,
//                               bindingText: $viewModel.password)
//                HStack {
//                    Text("En az 8 karakter.")
//                        .font(.boldRounded14)
//                        .foregroundColor(.ToofTextColor)
//                    Spacer()
//                }
//                .padding(.leading)
//                let passwordCorrect = (viewModel.password == viewModel.againPassword)
//                PrimaryButton(text: TextHelper.auth.authEntryCodeTextfieldPlaceholder.rawValue) {
//                    if passwordCorrect {
//                        //TODO: Update password
//                    }
//                }
//                .padding(.top,30)
//                Spacer()
//            }
//        }
//    }
//}
//
//struct AuthChangePasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthChangePasswordView()
//    }
//}
