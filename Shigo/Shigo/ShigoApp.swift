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
            ZStack{
                if AuthManager.shared.userCheck == nil {
                    SplashView()
                        .preferredColorScheme(.light)
                } else {
                    MainTabBar()
                        .environmentObject(AuthManager())
                        .preferredColorScheme(.light)
                }
            }
            .onAppear{
                AuthManager.shared.correctAuth = false
                AuthManager.shared.userData = nil
                AuthManager.shared.userCheck = nil
                print("ID: \(String(describing: AuthManager.shared.userCheck))")
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
