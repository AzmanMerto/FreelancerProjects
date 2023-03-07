//
//  SplashViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

typealias splashRouter = SplashRouter

class SplashViewModel : ObservableObject {
    
    var router = SplashRouter()
    
    var isAppReady : Bool
    
    init(router: SplashRouter = SplashRouter(),
         isAppReady: Bool = false) {
        self.router = router
        self.isAppReady = isAppReady
    }
    
    func fakeReady() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppReady = true
        }
    }
}
