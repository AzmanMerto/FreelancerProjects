//
//  AuthCodeView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct AuthCodeView: View {
    
    @ObservedObject var viewModel: AuthViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image("")
                    }

                }
                EntryHeader(title: TextHelper.auth.authSendVerificationCodeTitle.rawValue,
                            description: TextHelper.auth.authSendVerificationCodeDescription.rawValue)
                
                EntryTextField(isSecure: false, isActive: false, placeholderText: TextHelper.auth.authEntryCodeTextfieldPlaceholder.rawValue,
                               bindingText: $viewModel.code)
            }
        }
    }
}

struct AuthCodeView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCodeView()
    }
}
