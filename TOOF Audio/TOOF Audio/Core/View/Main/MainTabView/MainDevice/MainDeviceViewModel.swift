//
//  MainDeviceViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import Foundation

class MainDeviceViewModel: ObservableObject {
    @Published var isAddDevice: Bool
    init(isAddDevice: Bool = false) {
        self.isAddDevice = isAddDevice
    }
}
