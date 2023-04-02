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
    @State var isOpenedPlayerView = false
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BrowseView()
                    .tabItem {
                        Image(selectedTab == 0 ? ImageHelper.main.musicIconFilled.rawValue : ImageHelper.main.musicIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainBrowseTitle.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                    }
                    .tag(0)
                DeviceView()
                    .tabItem {
                        Image(selectedTab == 1 ? ImageHelper.main.deviceIconFilled.rawValue : ImageHelper.main.deviceIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainDeviceTitle.rawValue.locale())
                    }
                    .tag(1)
                SearchView()
                    .tabItem {
                        Image(selectedTab == 2 ? ImageHelper.main.searchIconFilled.rawValue : ImageHelper.main.searchIcon.rawValue)
                            .resizable()
                        Text(TextHelper.main.mainSearchTitle.rawValue.locale())
                    }
                    .tag(2)
                SettingsView()
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
            }
            .overlay {
                Group {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.ToofTextColor)
                        .overlay(content: {
                            //TODO: Fetch music
                            Color.ToofBackgroundPlayerColor
                                .cornerRadius(12)
                            HStack {
                                Image(ImageHelper.main.myMusic.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 54)
                                Text("Music Title")
                                    .font(.boldRounded14)
                                    .foregroundColor(.ToofTextColor)
                                Spacer()
                                Button {
                                    //TODO: Play music
                                } label: {
                                    Image(ImageHelper.player.playButton.rawValue)
                                }
                                .padding(.trailing)
                                Button {
                                    //TODO: Next music
                                } label: {
                                    Image(ImageHelper.player.forwardButton.rawValue)
                                }
                            }
                            .padding(.horizontal)
                        })
                        .frame(height: 67)
                        .padding(.horizontal,40)
                        .offset(CGSize(width: 0,height: UIScreen.main.bounds.height * 0.34))
                        .onTapGesture {
                            isOpenedPlayerView.toggle()
                        }
                }
                .opacity(viewModel.isLogout ? 0 : 1)
            }
        }
        .sheet(isPresented: $isOpenedPlayerView) {
            PlayerView()
                .presentationDetents([.large])
        }
    }
}

struct MainTabView_Preive: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
