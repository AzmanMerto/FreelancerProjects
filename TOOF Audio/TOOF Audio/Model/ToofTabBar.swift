//
//  ToofTabBar.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

enum ToofTabBar: Hashable {
    case browse,device,search,settings
    
    var tabBarImage: String {
        switch self {
        case .browse:
            return ImageHelper.main.musicIcon.rawValue
        case .device:
            return ImageHelper.main.deviceIcon.rawValue
        case .search:
            return ImageHelper.main.searchIcon.rawValue
        case .settings:
            return ImageHelper.main.settingsIcon.rawValue
        }
    }
    
    var tabBarImageFilled: String {
        switch self {
        case .browse:
            return ImageHelper.main.musicIconFilled.rawValue
        case .device:
            return ImageHelper.main.deviceIconFilled.rawValue
        case .search:
            return ImageHelper.main.searchIconFilled.rawValue
        case .settings:
            return ImageHelper.main.settingsIconFilled.rawValue
        }
    }
    
    var tabBarTitle: String {
        switch self {
        case .browse:
            return TextHelper.main.mainBrowseTitle.rawValue
        case .device:
            return TextHelper.main.mainDeviceTitle.rawValue
        case .search:
            return TextHelper.main.mainSearchTitle.rawValue
        case .settings:
            return TextHelper.main.mainSettingsTitle.rawValue
        }
    }    
}
