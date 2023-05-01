//
//  BluetoothManager.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.04.2023.
//

import CoreBluetooth
import SwiftUI

class BluetoothPermissionManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var bluetoothPermissionGranted: Bool = false
    private var centralManager: CBCentralManager!

    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            bluetoothPermissionGranted = true
        default:
            bluetoothPermissionGranted = false
        }
    }
}
