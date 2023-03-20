//
//  Metin2HanesiAdminPanelApp.swift
//  Metin2HanesiAdminPanel
//
//  Created by NomoteteS on 19.03.2023.
//

import SwiftUI
import Firebase

@main
struct Metin2HanesiAdminPanelApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AdminView()
        }
    }
}
