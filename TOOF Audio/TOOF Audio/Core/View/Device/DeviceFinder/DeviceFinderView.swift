//
//  DeviceFinderView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct DeviceFinderView: View {
    
    @ObservedObject var viewModel = DeviceFinderViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                //MARK: DeviceFinderView - Header
                deviceHeader(image: ImageHelper.deviceFinder.magnifyingGlass.rawValue,
                             title: TextHelper.deviceFinder.deviceFinderNearDeviceTitle.rawValue,
                             description: TextHelper.deviceFinder.deviceFinderNearDeviceDescription.rawValue)
                
                Spacer()
                //MARK: DeviceFinderView - Buttons
                VStack {
                    ZStack {
                        NavigationLink(isActive: $viewModel.isNavigateToHelp) {  DeviceHelpView() } label: {}

                        ToofButton(buttonText: TextHelper.deviceFinder.deviceFinderNearDeviceSearch.rawValue) {
                            viewModel.isNavigateToHelp.toggle()
                        }
                    }
                    .padding(.vertical,dw(0.1))
                    ToofAltButton(buttonText: TextHelper.deviceFinder.deviceFinderNearDeviceCancel.rawValue) {
                        dismiss()
                    }
                }
                .hideAndDisableButton(viewModel.isFoundDevice)
                Spacer()
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    viewModel.isFoundDevice.toggle()
                    //TODO: Find Device
                }
            }
        }
    }
}

struct DeviceFinderView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderView()
    }
}
