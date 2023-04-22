//
//  SettingsHelpView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.04.2023.
//

import SwiftUI

struct SettingsHelpView: View {
    
    @ObservedObject var viewModel: SettingsHelpViewModel
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                mainHeader(title: TextHelper.main.mainSettingsSubTitle.rawValue, isShowButton: true)
                
                Text(TextHelper.main.mainSettingsSubDescription.rawValue.locale())
                    .font(.default20).bold()
                    .foregroundColor(.ToofTextColor)
                    .padding(.horizontal,dw(0.1))
                                
                Image(ImageHelper.main.supportImage.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: dw(0.5))
                
                settingsExemple(title: TextHelper.main.mainSettingsSubMailTitle.rawValue,
                                exemple: TextHelper.main.mainSettingsSubMailExample.rawValue)
                .padding(.vertical)
                settingsExemple(title: TextHelper.main.mainSettingsSubPhoneTitle.rawValue,
                                exemple: TextHelper.main.mainSettingsSubPhoneExample.rawValue)
                Spacer()
                
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct SettingsHelpView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHelpView(viewModel: .init())
    }
}


extension SettingsHelpView {
    @ViewBuilder
    private func settingsExemple(title: String, exemple: String) -> some View {
        VStack(spacing: 10) {
            Text(title.locale())
                .foregroundColor(.ToofTextColor)
                .font(.default17).bold()
            Text(exemple.locale())
                .foregroundColor(.ToofPlaceholder)
                .font(.default16).bold()
        }
    }
}
