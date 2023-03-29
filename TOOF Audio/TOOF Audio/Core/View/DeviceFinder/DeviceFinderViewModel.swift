//
//  DeviceFinderViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import Foundation

class DeviceFinderViewModel: ObservableObject {
    
    @Published var isAddedDevice: Bool
    @Published var isBlinking: Bool
    
    init(isAddedDevice: Bool = false,
         isBlinking: Bool = false){
        self.isAddedDevice = isAddedDevice
        self.isBlinking = isBlinking
    }
    
}
