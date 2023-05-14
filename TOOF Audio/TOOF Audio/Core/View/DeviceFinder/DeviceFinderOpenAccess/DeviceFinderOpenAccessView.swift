//
//  DeviceFinderOpenAccessView.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.04.2023.
//

import SwiftUI
import Network

struct DeviceFinderOpenAccessView: View {
    
    @ObservedObject var viewModel = DeviceFinderOpenAccessViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                Text(TextHelper.deviceFinder.deviceFinderPermissionTitle.rawValue.locale())
                    .font(.default17).bold()
                    .padding(.vertical)
                    .padding(.horizontal)
                    .foregroundColor(.ToofTextColor)
                    .multilineTextAlignment(.center)
                PermissionDescription(image: Image(systemName: "globe"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionLocalNetwork.rawValue)
                PermissionDescription(image: Image("bluetooth"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionBluetooth.rawValue)
                .padding(.vertical)
                PermissionDescription(image: Image(systemName: "wifi"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionBluetooth.rawValue)
                PermissionDescription(image: Image(systemName: "mappin.circle.fill"), text:TextHelper.deviceFinder.deviceFinderPermissionGPS.rawValue)
                    .padding(.vertical)
                Spacer()
                PermisionCheckButton
                    .padding(.vertical)
                ToofAltButton(buttonText: "BACK") {
                    dismiss()
                }
                Spacer()
            }
            .padding(.vertical)
            .onAppear {
                viewModel.localNetworkManager.triggerLocalNetworkPrivacyAlert()
                if !viewModel.locationManager.locationPermissionGranted {    viewModel.locationManager.requestLocationPermission()  }
            }
        }
    }
}

struct DeviceFinderOpenAccessView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderOpenAccessView()
    }
}

extension DeviceFinderOpenAccessView {
    var PermisionCheckButton: some View {
        ZStack {
            NavigationLink(isActive: $viewModel.isNavigateToFinder) {
                DeviceFinderSearchView()
                    .hideNavigationBar()
            } label: {}
            ToofButton(buttonText: viewModel.buttonText) {
                if viewModel.locationManager.locationPermissionGranted {
                    print("locationPermissionGranted")
                    if viewModel.bluetoothManager.bluetoothPermissionGranted {
                        print("bluetoothPermissionGranted")
                        if viewModel.localNetworkManager.localNetworkPermissionGranted {
                            print("localNetworkPermissionGranted")
                            viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyButton.rawValue
                            viewModel.navigateToDestination()
                        } else {
                            viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyLocalNetworkButton.rawValue
                            openSettings()
                        }
                    } else {
                        viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyBluetoothButton.rawValue
                        openSettings()
                    }
                } else {
                    viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyGPSButton.rawValue
                    openSettings()
                }
            }
        }
        .padding(.vertical)
    }
}


