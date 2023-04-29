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
    
    
    var body: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            VStack {
                Spacer()
                Text(TextHelper.deviceFinder.deviceFinderPermissionTitle.rawValue.locale())
                    .font(.default22).bold()
                    .padding(.vertical)
                    .foregroundColor(.ToofTextColor)
                PermissionDescription(image: Image(systemName: "globe"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionLocalNetwork.rawValue)
                PermissionDescription(image: Image("bluetooth"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionBluetooth.rawValue)
                .padding(.vertical)
                PermissionDescription(image: Image(systemName: "wifi"),
                                      text: TextHelper.deviceFinder.deviceFinderPermissionBluetooth.rawValue)
                
                
                PermissionDescription(image: Image(systemName: "mappin.circle.fill"), text:TextHelper.deviceFinder.deviceFinderPermissionGPS.rawValue)
                    .padding(.vertical)
                
                Text(viewModel.localNetworkManager.localNetworkPermissionGranted.description)
                
                Spacer()
                
                PermisionCheckButton
                
                ToofAltButton(buttonText: "BACK") {
                    viewModel.dismiss()
                }
                .padding(.vertical)
            }
            .onAppear{
                
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
        ToofButton(buttonText: viewModel.buttonText) {
            if viewModel.locationManager.locationPermissionGranted {
                    print("locationPermissionGranted")
                if viewModel.bluetoothManager.bluetoothPermissionGranted {
                    print("bluetoothPermissionGranted")
                    viewModel.localNetworkManager.checkLocalNetworkPermission()
                    if viewModel.localNetworkManager.localNetworkPermissionGranted {
                        print("localNetworkPermissionGranted")
                        viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyButton.rawValue
                    } else {
                        viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyLocalNetworkButton.rawValue
                        viewModel.openSettings()
                    }
                } else {
                    viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyBluetoothButton.rawValue
                    viewModel.openSettings()
                }
            } else {
                viewModel.buttonText = TextHelper.deviceFinder.deviceFinderPermissionIsItOkeyGPSButton.rawValue
                viewModel.openSettings()
            }
        }
        .padding(.vertical)
    }
}


struct PermissionDescription: View {
    
    var image: Image
    var text: String
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                image
                    .resizable()
                    .foregroundColor(.ToofButtonColor)
                    .scaledToFit()
                    .frame(width: dh(0.06), height: dh(0.06))
                Text(text.locale())
                    .foregroundColor(.ToofTextColor)
                Spacer()
            }
            .padding(.leading)
            .frame(maxWidth: .infinity)
        .padding(.vertical)
        }
    }
}
