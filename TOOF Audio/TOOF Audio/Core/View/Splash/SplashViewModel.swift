//
//  SplashViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import Foundation
import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var isAppReady: Bool
    
    init(isAppReady: Bool = false) {
        self.isAppReady = isAppReady
        self.startApp()
    }
    
    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppReady = true
        }
    }
}
