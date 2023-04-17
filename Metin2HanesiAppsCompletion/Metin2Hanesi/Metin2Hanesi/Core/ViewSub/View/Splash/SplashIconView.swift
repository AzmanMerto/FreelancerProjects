//
//  SplashIconView.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct SplashIconView: View {
    var body: some View {
        ZStack {
            Color.MetinBackground.ignoresSafeArea()
            VStack {
                Image(ImageHelper.splashView.appIcon.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                
                Text("Metin2 Hanesi")
                    .foregroundColor(.MetinYellow)
                    .font(.title2)
                    .bold()
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.MetinYellow.opacity(0.4))
                    .padding(.all,-25)
            }
        }
    }
}

struct SplashIconView_Previews: PreviewProvider {
    static var previews: some View {
        SplashIconView()
    }
}
