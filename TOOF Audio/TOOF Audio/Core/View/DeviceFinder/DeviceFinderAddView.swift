//
//  DeviceFinderAddView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct DeviceFinderAddView: View {
    
    @ObservedObject var viewModel: DeviceFinderViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ToofBackgroundColor
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    //MARK: DeviceFinderAddView - Image
                    Image(ImageHelper.deviceFinder.searchWithWheel.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 273)
                    //MARK: DeviceFinderAddView - Header
                    DeviceFinderHeader(title: TextHelper.deviceFinder.deviceFinderAddDeviceTitle.rawValue,
                                       description: TextHelper.deviceFinder.deviceFinderAddDeviceDescription.rawValue)
                    .padding(.top)
                    Spacer()
                   //MARK: DeviceFinderAddView - Button
                    PrimaryButton(text: TextHelper.deviceFinder.deviceFinderAddDeviceButton.rawValue) {
                        viewModel.isAddedDevice.toggle()
                        //TODO: will add device find button
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $viewModel.isAddedDevice) {
                DeviceFinderConnectView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct DeviceFinderAdd_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderAddView()
    }
}
