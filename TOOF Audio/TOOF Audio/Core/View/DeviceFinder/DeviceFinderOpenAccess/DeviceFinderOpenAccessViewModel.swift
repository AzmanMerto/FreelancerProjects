//
//  DeviceFinderOpenAccessViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.04.2023.
//

import SwiftUI

class DeviceFinderOpenAccessViewModel: ObservableObject {
    
    let settings = URL(string: UIApplication.openSettingsURLString)
    @Published var locationManager = LocationPermissionManager()
    @Published var bluetoothManager = BluetoothPermissionManager()
    @Published var localNetworkManager = LocalNetworkPermissionManager()
    @Published var isNavigateToFinder : Bool
    @Published var buttonText : String    
    
    init(locationManager : LocationPermissionManager = LocationPermissionManager(),
         bluetoothManager : BluetoothPermissionManager = BluetoothPermissionManager(),
         localNetworkManager : LocalNetworkPermissionManager = LocalNetworkPermissionManager(),
         isNavigateToFinder: Bool = false,
         buttonText: String = TextHelper.deviceFinder.deviceFinderPermissionAnnouncedButton.rawValue) {
        self.locationManager = locationManager
        self.bluetoothManager = bluetoothManager
        self.localNetworkManager = localNetworkManager
        self.isNavigateToFinder = isNavigateToFinder
        self.buttonText = buttonText
    }
    
    func navigateToDestination() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isNavigateToFinder.toggle()
        }
    }
}
