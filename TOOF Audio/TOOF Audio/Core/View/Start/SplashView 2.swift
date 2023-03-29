//
//  SplashView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel : SplashViewModel = .init()
    @ObservedObject var coordinator : splashCoordinator = .init()
    
    var body: some View {

    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
