//
//  MainSettingsViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation

class MainSettingsViewModel: ObservableObject {
    
    let user : User
    let authManaer = AuthManager.shared
    @Published var settingsViewSection: ViewState? = nil
    
    init(user: User,
         settingsViewSection: ViewState? = nil) {
        self.user = user
        self.settingsViewSection = settingsViewSection
    }
    
    
    func signOut() {
        print("USER ID before signOut: \(String(describing: authManaer.currentUser))")
        authManaer.signOut()
        print("USER ID then signOut: \(String(describing: authManaer.currentUser))")
    }
    
    let settingsListItems: [CustomListModel] = [
        CustomListModel(id: 0,
                        imageString: ImageHelper.main.personIcon.rawValue,
                        buttonText: TextHelper.main.mainSettingsAccTitle.rawValue,
                        viewOpen: ViewState.account),
        CustomListModel(id: 1,
                        imageString: ImageHelper.main.supportIcon.rawValue,
                        buttonText: TextHelper.main.mainSettingsSubTitle.rawValue,
                        viewOpen: ViewState.support),
        CustomListModel(id: 2,
                        imageString: ImageHelper.main.logoutIcon.rawValue,
                        buttonText: TextHelper.main.mainSettingsLogout.rawValue,
                        viewOpen: ViewState.logout)
    ]
    
}


extension MainSettingsViewModel {
    
    enum ViewState: String, Identifiable {
        case account, support, logout
        
        var id: String {
            return self.rawValue
        }
    }

}
