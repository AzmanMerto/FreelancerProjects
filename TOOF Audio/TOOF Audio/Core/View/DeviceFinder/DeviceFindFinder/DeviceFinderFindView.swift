//
//  DeviceFinderFindView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct DeviceFinderFindView: View {
    
    @StateObject var viewModel = DeviceFinderViewModel()
    @Binding var backToBack : Bool
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
                    //Navigate to Helper View button
                    ZStack {
                        NavigationLink(isActive: $viewModel.isNavigateToHelp) {  DeviceFinderHelpView() } label: {}

                        ToofButton(buttonText: TextHelper.deviceFinder.deviceFinderNearDeviceSearch.rawValue) {
                            viewModel.isNavigateToHelp = true
                        }
                    }
                    .padding(.vertical,dw(0.1))
                    //Back button
                    ToofAltButton(buttonText: TextHelper.deviceFinder.deviceFinderNearDeviceCancel.rawValue) {
                        backToBack.toggle()
                        dismiss()
                    }
                }
                .hideAndDisableButton(viewModel.isFoundDevice)
                Spacer()
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    viewModel.isFoundDevice = false
                }
            }
        }
    }
}

struct DeviceFinderFindView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderFindView(backToBack: .constant(false))
    }
}
