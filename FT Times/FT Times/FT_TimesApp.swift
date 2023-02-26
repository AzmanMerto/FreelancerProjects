//
//  FT_TimesApp.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

@main
struct FT_TimesApp: App {
    
    init() {
        ATTrackingManager.requestTrackingAuthorization { status in
            GADMobileAds.sharedInstance().start(completionHandler: nil)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
