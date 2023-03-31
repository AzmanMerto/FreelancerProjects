//
//  InformationView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct InformationView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                MainTitleAndBack(isBackButtonShowing: true, title: TextHelper.main.mainDeviceSettingsInfoDevice.rawValue)
                    .padding(.bottom,50)
                VStack(spacing: 20) {
                    //Internet
                    VStack(spacing: 20) {
                        DeviceInfoInTitle(text: TextHelper.main.mainDeviceSettingsInfoDeviceEthernetStatus.rawValue)
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceEthernetStatusIp.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceEthernetStatusMac.rawValue, textConclusion: "")
                    }
                   //Hotspot
                    VStack(spacing: 20) {
                        DeviceInfoInTitle(text: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatus.rawValue)
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusSsid.rawValue, textConclusion: "")
                        HStack {
                            Text(TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusHotspotOpen.rawValue.locale())
                                .font(.boldRounded14)
                                .foregroundColor(.ToofTextColor)
                            Spacer()
                            Toggle(isOn: .constant(false)) {}
                                .tint(.red)
                        }
                    }
                    //Other
                    VStack(spacing: 20) {
                        DeviceInfoInTitle(text: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusOtherStatus.rawValue)
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusSpearkerName.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusFirmwareVersion.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusBeenDate.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusUuid.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusDeviceLanguage.rawValue, textConclusion: "")
                        DeviceInfoInRow(textDefinition: TextHelper.main.mainDeviceSettingsInfoDeviceHotspotStatusResetDevice.rawValue, textConclusion: "")
                    }
                }
                .padding(.horizontal,40)
                Spacer()

            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
