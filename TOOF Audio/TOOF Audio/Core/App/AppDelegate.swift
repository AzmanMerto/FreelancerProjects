//
//  AppDelegate.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import UIKit
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
    
    
}
