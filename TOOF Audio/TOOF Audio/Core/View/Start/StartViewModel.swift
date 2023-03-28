//
//  StartViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import Foundation

class StartViewModel: ObservableObject {
    
    @Published var isAppActive : Bool
    @Published var isPressedforAuth : Bool
    
    init(isAppActive: Bool = false,
         isPressedforAuth: Bool = false) {
        self.isAppActive = isAppActive
        self.isPressedforAuth = isPressedforAuth
        self.activeApp()
    }
    
    func activeApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppActive = true
        }
    }
    
}
