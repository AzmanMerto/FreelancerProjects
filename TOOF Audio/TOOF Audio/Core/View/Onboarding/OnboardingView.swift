//
//  OnboardingView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            viewModel.createRadialGradient()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                //MARK: OnboardingView - Top Image
                Image(ImageHelper.onboarding.onboardingImage.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(height: dh(0.4))
                Spacer()
                //MARK: OnboardingView - Logo
                Image(ImageHelper.app.toofLogo.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: dh(0.08))
                    .padding(.top,dh(0.1))
                //MARK: OnboardingView - Text
                Text(TextHelper.onboarding.appSlogan.rawValue.locale())
                    .foregroundColor(.ToofTextColor)
                    .font(.default20)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.8)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: dw(0.3), bottom: 0, trailing: dw(0.3)))
                Spacer()
                
                ZStack{
                    NavigationLink(isActive: $viewModel.isNavigateToLogin) {
                        AuthLoginView()
                            .hideNavigationBar()
                    } label: {}
                    viewModel.enterToAppButton()
                }
                .padding(.bottom,dh(0.05))
                .padding(.top)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
