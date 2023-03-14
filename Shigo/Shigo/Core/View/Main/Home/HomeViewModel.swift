//
//  HomeViewModel.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var isSignOut: Bool
    
    init(isSignOut: Bool = false) {
        self.isSignOut = isSignOut
    }
}
