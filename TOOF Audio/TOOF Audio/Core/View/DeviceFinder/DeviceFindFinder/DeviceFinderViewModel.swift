//
//  DeviceFinderViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import Foundation

class DeviceFinderViewModel: ObservableObject {
 
    @Published var isFoundDevice: Bool
    @Published var isNavigateToHelp: Bool
    
    init(isFoundDevice: Bool = true,
         isNavigateToHelp: Bool = false)
    {
        self.isFoundDevice = isFoundDevice
        self.isNavigateToHelp = isNavigateToHelp
        
    }
    
}
