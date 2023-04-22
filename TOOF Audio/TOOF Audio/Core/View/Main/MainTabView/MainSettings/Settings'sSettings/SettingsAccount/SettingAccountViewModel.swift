//
//  SettingAccountViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 21.04.2023.
//

import Foundation

class SettingAccountViewModel: ObservableObject {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
}
