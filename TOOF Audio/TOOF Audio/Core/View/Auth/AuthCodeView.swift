//
//  AuthCodeView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

//struct AuthCodeView: View {
//    
//    @ObservedObject var viewModel: AuthViewModel = .init()
//    
//    var body: some View {
//        ZStack {
//            AuthBackground()
//            VStack {
//                CustomBackButton()
//                    .padding(.top,90)
//                Spacer()
//                //MARK: AuthCodeView - Header
//                EntryHeader(title: TextHelper.auth.authSendVerificationCodeTitle.rawValue,
//                            description: TextHelper.auth.authSendVerificationCodeDescription.rawValue)
//                .padding(.bottom)
//                //MARK: AuthCodeView - Textfield
//                EntryTextField(isSecure: false,
//                               isActive: false,
//                               placeholderText: TextHelper.auth.authEntryCodeTextfieldPlaceholder.rawValue,
//                               bindingText: $viewModel.code)
//                .padding(.vertical)
//                //MARK: AuthCodeView - Button
//                PrimaryButton(text: TextHelper.auth.authVerifactionButton.rawValue) {
//                    //TODO: Get code 
//                }
//                .padding(.top)
//                Spacer()
//                Spacer()
//            }
//        }
//    }
//}
//
//struct AuthCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthCodeView()
//    }
//}
