//
//  StartOnboardingView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

struct StartOnboardingView: View {
    
    @ObservedObject var viewModel: StartViewModel = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white,Color.ToofBackgroundColor]),
                               startPoint: .top,
                               endPoint: .init(x: 0.5, y: 0.7))
                .ignoresSafeArea()
                VStack {
                    Image(ImageHelper.start.onboardingImage.rawValue)
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height / 2)
                        .ignoresSafeArea()
                    VStack {
                        Image(ImageHelper.app.toofLogo.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200,
                                   height: 60)
                        Text(TextHelper.onboarding.appSlogan.rawValue.locale())
                            .padding(.top)
                            .font(.system(.headline, weight: .black))
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets.init(top: 30,
                                                     leading: 80,
                                                     bottom: 0,
                                                     trailing: 80))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    NavigationLink {
                        AuthLoginView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text(TextHelper.onboarding.onboardingStartButton.rawValue.locale())
                            .foregroundColor(.ToofTextColor)
                            .font(.boldRounded14)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.ToofButtonColor)
                            .frame(height: 50)
                            .padding(.horizontal,-10)
                    }
                    .padding(.bottom,40)
                }
            }
        }
    }
}

struct StartOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        StartOnboardingView()
    }
}
