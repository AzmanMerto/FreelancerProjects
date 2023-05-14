//
//  DeviceFinderSearchViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import Foundation

class DeviceFinderSearchViewModel: ObservableObject {
    
    @Published var isStartSearch: Bool
    @Published var isNavigateToFinder: Bool
    @Published var backToBack: Bool
    @Published var selected: Int
    
    init(isStartSearch: Bool = false,
         isNavigateToFinder: Bool = false,
         backToBack: Bool = false,
         selected: Int = 0) {
        self.isStartSearch = isStartSearch
        self.isNavigateToFinder = isNavigateToFinder
        self.backToBack = backToBack
        self.selected = selected
    }
    
    let DeviceViewItems: [DeviceView] = [
        DeviceView(image: ImageHelper.deviceFinder.searchWithWheel.rawValue,
                   title: TextHelper.deviceFinder.deviceFinderAddDeviceTitle.rawValue,
                   description: TextHelper.deviceFinder.deviceFinderAddDeviceDescription.rawValue,
                   button: TextHelper.deviceFinder.deviceFinderAddDeviceButton.rawValue,
                   tag: 0),
        DeviceView(image: ImageHelper.deviceFinder.threePoint.rawValue,
                   title: TextHelper.deviceFinder.deviceFinderConnectDeviceTitle.rawValue,
                   description: TextHelper.deviceFinder.deviceFinderConnectDeviceDescription.rawValue,
                   button: TextHelper.deviceFinder.deviceFinderConnectDeviceButton.rawValue,
                   tag: 1)
    ]
}

