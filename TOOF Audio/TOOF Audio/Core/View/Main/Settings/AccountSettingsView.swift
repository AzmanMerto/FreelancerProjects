//
//  AccountSettingsView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct AccountSettingsView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainSettingsAccTitle.rawValue)
                    .padding(.bottom,30)
                VStack(spacing: 40) {
                    //TODO: Firebase fetch data
                    EntryTextField(isSecure: false, isActive: false, placeholderText: "", bindingText: .constant(""))
                    EntryTextField(isSecure: false, isActive: false, placeholderText: "", bindingText: .constant(""))
                    EntryTextField(isSecure: false, isActive: false, placeholderText: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue, bindingText: .constant(""))
                }
                .padding(.horizontal)
                .foregroundColor(.ToofTextColor)
                .multilineTextAlignment(.center)
                
                PrimaryButton(text: TextHelper.main.mainSettingsAccButton.rawValue) {
                    //TODO: Save Value
                }
                .padding(.top,40)
                Spacer()
            }
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
