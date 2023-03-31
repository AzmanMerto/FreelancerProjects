//
//  DeviceSettingsView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 30.03.2023.
//

import SwiftUI

enum viewKey: String,Identifiable {
    case rename,info,alarm,equalizer,content
    
    var id: viewKey {
        return self
    }
}

struct DeviceSettingsView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    @State var viewkey: viewKey? = nil
    var deviceName: String
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                MainTitleAndBack(isBackButtonShowing: true, title: deviceName)
                Spacer()
                VStack(spacing: 0) {
                    DeviceSettingsList(image: ImageHelper.main.renameIcon.rawValue,
                                       text: TextHelper.main.mainDeviceSettingsRenameDevice.rawValue){
                        viewkey = .rename
                    }
                    Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                    DeviceSettingsList(image: ImageHelper.main.infoIcon.rawValue,
                                       text: TextHelper.main.mainDeviceSettingsInfoDevice.rawValue){
                        viewkey = .info
                    }
                    Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                    DeviceSettingsList(image: ImageHelper.main.alarmIcon.rawValue,
                                       text: TextHelper.main.mainDeviceSettingsAlarm.rawValue){
                        viewkey = .alarm
                    }
                    Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                    DeviceSettingsList(image: ImageHelper.main.equalizerIcon.rawValue,
                                       text: TextHelper.main.mainDeviceSettingsEQ.rawValue){
                        viewkey = .equalizer
                    }
                    Rectangle().frame(height: 1).foregroundColor(.ToofTextColor).padding(.vertical)
                    DeviceSettingsList(image: ImageHelper.main.contentIcon.rawValue,
                                       text: TextHelper.main.mainDeviceSettingsCustomContent.rawValue){
                        viewkey = .content
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .fullScreenCover(item: $viewkey, content: { viewKey in
            switch viewKey {
            case .rename:
                RenameView(deviceName: deviceName)
            case .info:
                InformationView()
            case .alarm:
                AlarmView()
            case .equalizer:
                EQView()
            case .content:
                ContentView(deviceName: deviceName)
            }
        })
    }
}

struct DeviceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSettingsView(deviceName: "")
    }
}

