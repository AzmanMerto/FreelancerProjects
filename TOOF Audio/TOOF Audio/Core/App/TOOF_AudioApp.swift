//
//  TOOF_AudioApp.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct TOOF_AudioApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
                
        WindowGroup {
            NavigationView {
                SplashView()
                    .hideNavigationBar()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
