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

class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

//      ApplicationDelegate.shared.application(
//                 application,
//                 didFinishLaunchingWithOptions: launchOptions
//             )
    return true
  }
    
//    func application(
//            _ app: UIApplication,
//            open url: URL,
//            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//        ) -> Bool {
//            ApplicationDelegate.shared.application(
//                app,
//                open: url,
//                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//            )
//        }
//
//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//        guard let url = URLContexts.first?.url else {
//            return
//        }
//
//        ApplicationDelegate.shared.application(
//            UIApplication.shared,
//            open: url,
//            sourceApplication: nil,
//            annotation: [UIApplication.OpenURLOptionsKey.annotation]
//        )
//    }

}


