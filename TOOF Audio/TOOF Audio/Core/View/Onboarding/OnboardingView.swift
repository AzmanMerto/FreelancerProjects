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
                    .frame(height: dh(0.15))
                
                Spacer()
                //MARK: OnboardingView - Logo
                Image(ImageHelper.app.toofLogo.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: dh(0.08))
                    .padding(.top,dh(0.2))
                Spacer()
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
            .onAppear{
                print("USER ID Onboarding: \(String(describing: AuthManager.shared.user?.id))")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
