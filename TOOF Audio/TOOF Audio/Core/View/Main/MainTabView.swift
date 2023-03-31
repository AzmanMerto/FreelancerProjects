//
//  MainTabView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.red)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            let browseStatus = (selectedTab == 0)
            BrowseView()
                .tabItem {
                    Image(ImageHelper.main.searchIcon.rawValue)
                        .resizable()
                    
                    Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                }
                .tint(browseStatus ? Color.white : Color.red )
            
                .tag(0)
            DeviceView()
                .tabItem {
                    Image(ImageHelper.main.searchIcon.rawValue)
                        .resizable()
                    Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                }
                .tag(1)
            SearchView()
                .tabItem {
                    Image(ImageHelper.main.searchIcon.rawValue)
                        .resizable()
                    Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                }
                .tag(2)
            SettingsView()
                .tabItem {Image(ImageHelper.main.searchIcon.rawValue)
                        .resizable()
                    Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                    
                }
                .tag(3)
        }
    }
}

struct MainTabView_Preive: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
