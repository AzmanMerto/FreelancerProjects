//
//  ShigoApp.swift
//  Shigo
//
//  Created by NomoteteS on 10.02.2023.
//

import SwiftUI
import Firebase

@main
struct ShigoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if AuthManager.shared.userCheck == nil {
                SplashView()
                    .preferredColorScheme(.light)
            } else {
                MainTabBar()
                    .environmentObject(AuthManager())
                    .preferredColorScheme(.light)
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
