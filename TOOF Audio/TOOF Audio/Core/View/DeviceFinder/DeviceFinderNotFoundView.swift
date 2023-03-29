//
//  DeviceFinderNotFoundView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct DeviceFinderNotFoundView: View {
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: DeviceFinderNotFoundView - Header
                DeviceFinderHeader(title: TextHelper.deviceFinder.deviceFinderSearchHelpTitle.rawValue)
                //MARK: DeviceFinderNotFoundView - Line Helper
                Spacer()
                HStack {
                    Image("line")
                        .resizable()
                        .scaledToFit()
                    VStack(spacing: 30) {
                        Text(TextHelper.deviceFinder.deviceFinderSearchHelpSectionOne.rawValue)
                        Text(TextHelper.deviceFinder.deviceFinderSearchHelpSectionTwo.rawValue)
                        Text(TextHelper.deviceFinder.deviceFinderSearchHelpSectionThree.rawValue)
                        Text(TextHelper.deviceFinder.deviceFinderSearchHelpSectionFour.rawValue)
                    }
                    
                }
                .frame(height: 168)
                Spacer()
                //MARK: DeviceFinderNotFoundView - Button
                PrimaryButton(text: TextHelper.deviceFinder.deviceFinderSearchHelpButton.rawValue) {
                    
                }
                Spacer()
            }
        }
    }
}

struct DeviceFinderNotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderNotFoundView()
    }
}
