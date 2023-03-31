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
    
    @ObservedObject var viewModel: MainViewModel = .init()
    @State var settingViewKey: SettingViewKey? = nil

    var body: some View {
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
                        //TODO: Logout
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .fullScreenCover(item: $settingViewKey, content: { settingViewKey in
                switch settingViewKey {
                case .accSettings:
                    EmptyView()
                case .help:
                    EmptyView()
                }
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
