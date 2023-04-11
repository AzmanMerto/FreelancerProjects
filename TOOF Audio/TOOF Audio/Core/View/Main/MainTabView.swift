//
//  MainTabView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BrowseView(viewModel: viewModel)
                    .tabItem {
                        Image(selectedTab == 0 ? ImageHelper.main.musicIconFilled.rawValue : ImageHelper.main.musicIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                    }
                    .tag(0)
                DeviceView(viewModel: viewModel)
                    .tabItem {
                        Image(selectedTab == 1 ? ImageHelper.main.deviceIconFilled.rawValue : ImageHelper.main.deviceIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainDeviceTitle.rawValue.locale())
                    }
                    .tag(1)
                SearchView(viewModel: viewModel)
                    .tabItem {
                        Image(selectedTab == 2 ? ImageHelper.main.searchIconFilled.rawValue : ImageHelper.main.searchIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainSearchTitle.rawValue.locale())
                    }
                    .tag(2)
                    .onAppear{
                        viewModel.musicFiles = viewModel.fetchMusicFilesFromDocuments()
                    }
                SettingsView(viewModel: viewModel)
                    .tabItem {Image(selectedTab == 3 ? ImageHelper.main.settingsIconFilled.rawValue : ImageHelper.main.settingsIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainSettingsTitle.rawValue.locale())
                    }
                    .tag(3)
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = UIColor(Color.ToofPlaceholder).withAlphaComponent(0.2)
                UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor(Color.red)], for: .normal)
                UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor(Color.ToofTextColor)], for: .selected)
                AuthManager.shared.fetchUserData()
                viewModel.isLogout = false
            }
            .overlay {
                PlayerBottomView()
            }
        }
    }
}

struct MainTabView_Preive: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

