//
//  DeviceFinderConnectView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct DeviceFinderConnectView: View {
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: DeviceFinderConnectViev - Image
                Image(ImageHelper.deviceFinder.threePoint.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 182)
                //MARK: DeviceFinderConnectView - Header
                DeviceFinderHeader(title: TextHelper.deviceFinder.deviceFinderConnectDeviceTitle.rawValue,
                                   description: TextHelper.deviceFinder.deviceFinderConnectDeviceDescription.rawValue)
                .padding(.top)
                Spacer()
                //MARK: DeviceFinderConnectView - Button
                PrimaryButton(text: TextHelper.deviceFinder.deviceFinderConnectDeviceButton.rawValue) {
                    
                }
                Spacer()
            }
        }
    }
}

struct DeviceFinderConnect_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderConnectView()
    }
}
