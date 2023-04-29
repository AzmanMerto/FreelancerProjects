//
//  MainTabViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation

class MainTabViewModel: ObservableObject {
    
    let authManager = AuthManager.shared
    let user : User
    
    @Published var musicFiles: [URL]
    @Published var currentPlayURL: URL?
    @Published var selection: ToofTabBar
    
    init(user: User = AuthManager.shared.user ?? User(),
         musicFiles: [URL] = [],
         selection: ToofTabBar = .browse) {
        self.user = user
        self.musicFiles = musicFiles
        self.selection = selection
    }
    
    
    
}
