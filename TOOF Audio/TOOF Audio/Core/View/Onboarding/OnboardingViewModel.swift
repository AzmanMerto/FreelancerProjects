//
//  OnboardingViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.02.2023.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    @Published var isPressed : Bool
    
    init(isPressed: Bool = false) {
        self.isPressed = isPressed
    }
}
