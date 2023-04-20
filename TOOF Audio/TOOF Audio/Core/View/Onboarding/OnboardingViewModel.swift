//
//  OnboardingViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @Published var isNavigateToLogin: Bool
    
    init(isNavigateToLogin: Bool = false) {
        self.isNavigateToLogin = isNavigateToLogin
    }
    
    func createRadialGradient() -> RadialGradient {
        return RadialGradient(
            colors: [.ToofPlaceholder, .ToofBackgroundColor],
            center: .top,
            startRadius: 10,
            endRadius: 600
        )
    }
    
    func enterToAppButton() -> some View {
        Button {
            self.isNavigateToLogin.toggle()
        } label: {
            Text(TextHelper.onboarding.onboardingStartButton.rawValue.locale())
                .foregroundColor(.ToofTextColor)
                .font(.default15)
                .fontWeight(.bold)
        }
        .buttonStyle(enterToAppButtonStyle())
    }
    
    struct enterToAppButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background {
                    Color.ToofButtonColor.ignoresSafeArea()
                        .cornerRadius(20)
                        .padding(.all,-15)
                }
                
        }
    }
}


