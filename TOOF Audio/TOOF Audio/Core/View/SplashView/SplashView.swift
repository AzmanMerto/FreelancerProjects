//
//  SplashView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel : SplashViewModel = .init()
    
    var body: some View {
        if viewModel.isAppReady {
            viewModel.router.goToOnboarding()
        }
        SplashUISubView()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
