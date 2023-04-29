//
//  MainTabView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 18.04.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var viewModel = MainTabViewModel()
    
    var body: some View {
        CustomTabBarContainer(selection: $viewModel.selection) {
            MainBrowseView()
                .tabBarItem(item: .browse, selection: $viewModel.selection)
            
            MainDeviceView(viewModel: .init())
                .tabBarItem(item: .device, selection: $viewModel.selection)

            MainSearchView(viewModel: .init(musicFiles: viewModel.musicFiles, currentPlayURL: viewModel.currentPlayURL))
                .tabBarItem(item: .search, selection: $viewModel.selection)

            MainSettingsView(viewModel: .init(user: viewModel.user))
                .tabBarItem(item: .settings, selection: $viewModel.selection)
        }
        .onAppear{
            viewModel.authManager.fetchUser()
            print("USER ID MainTabView: \(String(describing: AuthManager.shared.user?.id))")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
