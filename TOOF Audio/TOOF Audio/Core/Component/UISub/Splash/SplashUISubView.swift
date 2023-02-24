//
//  SplashUISubView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.02.2023.
//

import SwiftUI

struct SplashUISubView: View {
    var body: some View {
        ZStack {
            Color.ToofPrimaryColorAlt
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image.AppLogo
                    .resizable()
                    .frame(width: 244, height: 109)
                Spacer()
                Spacer()
            }
        }
    }
}

struct SplashUISubView_Previews: PreviewProvider {
    static var previews: some View {
        SplashUISubView()
    }
}
