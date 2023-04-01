//
//  StartSplashView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import SwiftUI

struct StartSplashView: View {
    
    @ObservedObject var viewModel: StartViewModel = .init()
    
    var body: some View {
        if viewModel.isAppActive {
            if AuthManager.shared.currentUser != nil {
                MainTabView()
            } else {
                StartOnboardingView()
            }
        } else {
            SplashUISubView()
        }
    }
}

struct StartSplashView_Previews: PreviewProvider {
    static var previews: some View {
        StartSplashView()
    }
}
