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
                //MARK: DeviceFinderNearView - Image
                Image(ImageHelper.deviceFinder.magnifyingGlass.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 166)
                //MARK: DeviceFinderNearView - Header
                DeviceFinderHeader(title: TextHelper.deviceFinder.deviceFinderNearDeviceTitle.rawValue,
                                   description: TextHelper.deviceFinder.deviceFinderNearDeviceDescription.rawValue)
                .padding(.top)
                Spacer()
                //MARK: DeviceFinderNearView - Buttons
                VStack(spacing: 22) {
                    PrimaryButton(text: TextHelper.deviceFinder.deviceFinderNearDeviceSearch.rawValue) {
                        
                    }
                    NavigationLink {
                        DeviceFinderAddView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text(TextHelper.deviceFinder.deviceFinderNearDeviceCancel.rawValue.locale())
                            .foregroundColor(.ToofButtonColor)
                    }
                    .frame(width: 170, height: 40)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.ToofButtonColor, lineWidth: 1)
                            .frame(width: 170, height: 40)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.ToofTextColor)
                            }
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
