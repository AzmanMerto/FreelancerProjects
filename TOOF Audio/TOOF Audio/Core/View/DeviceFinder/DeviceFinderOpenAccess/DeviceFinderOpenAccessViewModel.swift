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
    @Published var buttonText : String
    @Environment(\.dismiss) var dismiss
    
    
    init(buttonText: String = TextHelper.deviceFinder.deviceFinderPermissionAnnouncedButton.rawValue) {
        self.buttonText = buttonText
    }
    
    func openSettings() {
        UIApplication.shared.open(settings!)
    }
}
