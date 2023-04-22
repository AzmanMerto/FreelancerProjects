//
//  SettingsAccountView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.04.2023.
//

import SwiftUI

struct SettingsAccountView: View {
    
    @ObservedObject var viewModel: SettingAccountViewModel
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainSettingsAccTitle.rawValue,
                           isShowButton: true)
                
                ToofTextField(textField: .constant(""), placeholder: viewModel.user.name!)
                
                ToofTextField(textField: .constant(""), placeholder: viewModel.user.mail!)
                
                ToofTextField(textField: .constant(""), placeholder: TextHelper.auth.authPasswordTextfieldPlaceholder.rawValue)

                Spacer()
                ToofButton(buttonText: TextHelper.main.mainSettingsAccButton.rawValue) {
                    //TODO: Save changes on acc
                }
                
                Spacer()
            }
        }
    }
}

struct SettingsAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAccountView(viewModel: .init(user: User(mail: "", name: "")))
    }
}
