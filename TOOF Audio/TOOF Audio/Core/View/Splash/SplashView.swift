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
        NavigationView {
            if viewModel.isAppReady {
                if AuthManager.shared.currentUser != nil {
                    MainTabView()
                        .hideNavigationBar()
                } else {
                    OnboardingView()
                        .hideNavigationBar()
                }
            }else {
                splashFastView()
            }
        }
        .hideNavigationBar()
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            print("User info: \(String(describing: AuthManager.shared.currentUser))")
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
