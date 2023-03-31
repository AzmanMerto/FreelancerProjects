//
//  SupportView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct SupportView: View {
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainSettingsSubTitle.rawValue)
                    .padding(.bottom,30)
                VStack(spacing: 20) {
                    Text(TextHelper.main.mainSettingsSubDescription.rawValue.locale())
                    
                    Image(ImageHelper.main.supportImage.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top)
                    
                    Text(TextHelper.main.mainSettingsSubMailTitle.rawValue.locale())
                    
                    Text(TextHelper.main.mainSettingsSubMailExample.rawValue.locale())
                    
                    Text(TextHelper.main.mainSettingsSubPhoneTitle.rawValue.locale())
                    
                    Text(TextHelper.main.mainSettingsSubPhoneExample.rawValue.locale())
                        .foregroundColor(.ToofTextSoftColor)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .font(.semiDefault20)
                .tint(.ToofTextSoftColor)
                .foregroundColor(.ToofTextColor)
                Spacer()
            }
        }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
