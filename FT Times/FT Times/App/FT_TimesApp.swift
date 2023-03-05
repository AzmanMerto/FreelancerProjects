//
//  FT_TimesApp.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import Foundation
import SwiftUI

@main
struct FT_TimesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
