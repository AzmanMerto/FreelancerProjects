//
//  SplashView.swift
//  Shigo
//
//  Created by NomoteteS on 10.02.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var vm : SplashViewModel = .init()
    
    var body: some View {
        if vm.isSplashed {
            LoginView()
        } else {
            ZStack {
                Image(Imagements.Splash.SplashBackground.rawValue)
                VStack(spacing: 100) {
                    
                    Spacer()
                    
                    Image(Imagements.Splash.TopCategoryLine.rawValue)
                        .SplashViewLines()
                    
                    Spacer()
                    
                    Image(Imagements.Splash.BottomCategoryLine.rawValue)
                        .SplashViewLines()
                    
                    Spacer()
                    
                }
                VStack(spacing: 10) {
                    
                    Spacer() // Spacer

                    Image(Imagements.Splash.Logo.rawValue)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.7,
                               height: UIScreen.main.bounds.height * 0.4)
                        .padding(.vertical)
     
                    Spacer() // Spacer
                    
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    vm.isSplashed = true
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

private struct modi : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: UIScreen.main.bounds.height * 0.2)
        
    }
}
