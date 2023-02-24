//
//  SplashRouter.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import Foundation

final class SplashRouter{}

protocol SplashRouterProtocol {
    func goToOnboarding() -> OnboardingView
}

extension SplashRouter : SplashRouterProtocol {
    func goToOnboarding() -> OnboardingView {
        OnboardingView()
    }
}
