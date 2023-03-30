//
//  DeviceView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct DeviceView: View {
    
    @ObservedObject var viewModel: MainViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: DeviceView - Title
                MainTitleAndBack(title: TextHelper.main.mainDeviceTitle.rawValue)
                    .padding(.vertical,30)
                //MARK: DeviceView - Devices
                ForEach(viewModel.deviceModelItems ,id: \.deviceGivenName) { device in
                    Rectangle()
                        .foregroundColor(.ToofTextColor)
                        .frame(height: 1)
                        .padding(.horizontal)
                    DeviceShowcase(isPlaying: $viewModel.isPlaying,
                                   deviceVolume: $viewModel.deviceVolume,
                                   deviceTitle: device.deviceGivenName,
                                   musicName: viewModel.atNowPlayingItem) {
                        
                    }
                }
                //MARK: DeviceView - Button
                PrimaryButton(text: TextHelper.main.mainDeviceAddNewdevice.rawValue,
                              size: CGSize(width: 190, height: 40),
                              textColor: .ToofPrimaryColorAlt,
                              backgroundColor: .ToofTextColor) {
                    //TODO: Append new value
                }
                Spacer()
            }
        }
    }
}

struct DeviceView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceView()
    }
}