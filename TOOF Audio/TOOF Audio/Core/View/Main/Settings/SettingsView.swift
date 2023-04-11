//
//  SettingsView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

enum SettingViewKey: String,Identifiable {
    case accSettings,help
    
    var id: SettingViewKey {
        return self
    }
}

struct SettingsView: View {
    
    @StateObject var viewModel: MainViewModel
    @State var settingViewKey: SettingViewKey? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Color.ToofBackgroundColor
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    MainTitleAndBack(title: TextHelper.main.mainSettingsTitle.rawValue)
                        .padding(.bottom,30)
                    //MARK: SettingsView - Sections
                    VStack {
                        DeviceSettingsList(image: ImageHelper.main.personIcon.rawValue,
                                           text: TextHelper.main.mainSettingsAccTitle.rawValue){
                            settingViewKey = .accSettings
                        }
                        Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                        DeviceSettingsList(image: ImageHelper.main.supportIcon.rawValue,
                                           text: TextHelper.main.mainSettingsSubTitle.rawValue){
                            settingViewKey = .help
                        }
                        Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                        DeviceSettingsList(image: ImageHelper.main.logoutIcon.rawValue,
                                           text: TextHelper.main.mainSettingsLogout.rawValue){
                            AuthManager.shared.logout()
                            viewModel.isLogout = true
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .fullScreenCover(isPresented: $viewModel.isLogout, content: {
                    StartOnboardingView()
                        .toolbar(.hidden, for: .tabBar)
                        .navigationBarBackButtonHidden(true)
                })
                .fullScreenCover(item: $settingViewKey, content: { settingViewKey in
                    switch settingViewKey {
                    case .accSettings:
                        AccountSettingsView()
                    case .help:
                        SupportView()
                    }
                })
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
