//
//  AppDelegate.swift
//  FT Times
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation
import GoogleMobileAds
import AppTrackingTransparency
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    GADMobileAds.sharedInstance().start(completionHandler: nil)
      
    FirebaseApp.configure()

    return true
      
  }
    
    override init() {
        ATTrackingManager.requestTrackingAuthorization { status in
            GADMobileAds.sharedInstance().start(completionHandler: nil)
        }
    }

}

