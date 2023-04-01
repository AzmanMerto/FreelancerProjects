//
//  TOOF_AudioApp.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.02.2023.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct TOOF_AudioApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            StartSplashView()
        }
    }
}
