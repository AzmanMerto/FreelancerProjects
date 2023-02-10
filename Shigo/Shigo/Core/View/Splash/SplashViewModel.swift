//
//  SplashViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 10.02.2023.
//

import Foundation

class SplashViewModel: ObservableObject {
    @Published var isSplashed : Bool
    
    init(isSplashed: Bool = false) {
        self.isSplashed = isSplashed
    }
}
