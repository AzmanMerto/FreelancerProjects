//
//  Metin2Hanesi.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 15.03.2023.
//

import SwiftUI
import FirebaseCore

@main
struct Metin2Hanesi: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}


