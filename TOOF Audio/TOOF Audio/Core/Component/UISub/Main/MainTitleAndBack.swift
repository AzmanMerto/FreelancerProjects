//
//  MainTitleAndBack.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct MainTitleAndBack: View {
    
    @Environment(\.dismiss) var dismiss
    var isBackButtonShowing: Bool?
    var title: String
    var body: some View {
        ZStack {
            Text(title.locale())
                .foregroundColor(.ToofTextColor)
                .font(.semiDefault20)
            HStack {
                Button { dismiss() } label: {
                    Image(ImageHelper.auth.customBack.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                }
                .opacity((isBackButtonShowing ?? false) ? 1 : 0)
                .padding(.leading)
                
                Spacer()
            }
        }
        .padding(.top,30)
    }
}

struct MainTitleAndBack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            MainTitleAndBack(isBackButtonShowing: true,
                             title: "asdaslkd")
        }
    }
}
