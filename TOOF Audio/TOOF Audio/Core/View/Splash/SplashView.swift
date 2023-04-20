//
//  SplashView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.isAppReady {
            if AuthManager.shared.currentUser != nil {
                MainTabView()
            } else {
                OnboardingView()
            }
        }else {
            splashFastView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
