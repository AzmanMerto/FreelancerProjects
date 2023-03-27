//
//  OnboardingViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.02.2023.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    
    var coordinator : onboardingCoordinator
    @Published var isPressed : Bool
    
    init(coordinator : onboardingCoordinator = .init(),
        isPressed: Bool = false) {
        self.coordinator = coordinator
        self.isPressed = isPressed
    }
}
