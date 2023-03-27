//
//  SplashView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel : SplashViewModel = .init()
    
    var body: some View {
        ZStack {
            if viewModel.isAppActive {
                viewModel.coordinator.build(page: .NextCoordinator)
            } else {
                SplashUISubView()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
