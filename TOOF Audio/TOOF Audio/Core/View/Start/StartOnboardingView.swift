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
        NavigationStack {
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
                                                     leading: 120,
                                                     bottom: 0,
                                                     trailing: 120))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    PrimaryButton(text: TextHelper.onboarding.onboardingStartButton.rawValue ,
                                  size: CGSize(width: 156,height: 48)) {
                        viewModel.isPressedforAuth.toggle()
                        print("Navigate RESPONSE: Navigate to Login")
                    }.padding(.bottom)
                }
                .navigationDestination(isPresented: $viewModel.isPressedforAuth) {
                    AuthLoginView()
                        .navigationBarBackButtonHidden(true)
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
