//
//  DeviceFinderHelpViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import Foundation

class DeviceFinderHelpViewModel: ObservableObject {
    
    let helpItems: [Help] = [
        Help(text: TextHelper.deviceFinder.deviceFinderSearchHelpSectionOne.rawValue),
        Help(text: TextHelper.deviceFinder.deviceFinderSearchHelpSectionTwo.rawValue),
        Help(text: TextHelper.deviceFinder.deviceFinderSearchHelpSectionThree.rawValue),
        Help(text: TextHelper.deviceFinder.deviceFinderSearchHelpSectionFour.rawValue)
    ]
    
}

struct Help {
    var text: String
}
