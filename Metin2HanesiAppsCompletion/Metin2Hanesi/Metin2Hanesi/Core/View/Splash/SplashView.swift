//
//  SplashView.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 15.04.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.isStartedApp {
            MainView()
        }else {
            //MARK: SplashView - View
            SplashIconView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


