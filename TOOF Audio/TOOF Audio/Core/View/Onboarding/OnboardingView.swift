//
//  OnboardingView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel : OnboardingViewModel = .init()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.ToofBackgroundColor]),
                           startPoint: .top,
                           endPoint: .init(x: 0.5, y: 0.7))
            .ignoresSafeArea()
            VStack {
                Image.OnboardingImage
                    .resizable()
                    .frame(width: .infinity,
                           height: UIScreen.main.bounds.height / 2)
                    .ignoresSafeArea()
                VStack {
                    Image.ToofLogo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,
                               height: 60)

                    Text("Evinizi kontrol etmenin en iyi yolu")
                        .padding(.top)
                        .font(.system(.headline, weight: .black))
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets.init(top: 30, leading: 120, bottom: 0, trailing: 120))
                        .foregroundColor(.white)

                    PrimaryButton(action: {

                    }, text: "")
                }
                Spacer()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
