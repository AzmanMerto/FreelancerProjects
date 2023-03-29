//
//  DeviceFinderNearView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.03.2023.
//

import SwiftUI

struct DeviceFinderNearView: View {
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image(ImageHelper.deviceFinder.magnifyingGlass.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 166)
                DeviceFinderHeader(title: TextHelper.deviceFinder.deviceFinderNearDeviceTitle.rawValue,
                                   description: TextHelper.deviceFinder.deviceFinderNearDeviceDescription.rawValue)
                .padding(.top)
                Spacer()
                VStack {
                    PrimaryButton(text: TextHelper.deviceFinder.deviceFinderNearDeviceSearch.rawValue) {
                        
                    }
                    
                    NavigationLink {
                        DeviceFinderAddView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text(TextHelper.deviceFinder.deviceFinderNearDeviceCancel.rawValue.locale())
                    }

                }
                Spacer()
            }
        }
    }
}

struct DeviceFinderNearView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderNearView()
    }
}
