//
//  Metin2AddServerAppApp.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 15.03.2023.
//

import SwiftUI
import FirebaseCore

@main
struct Metin2AddServerAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


