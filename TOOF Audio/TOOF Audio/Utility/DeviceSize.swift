//
//  DeviceSize.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

enum DeviceSize {
    case medium
    case large
    case xLarge
    case xxLarge
    case mega
    case xMega
    case xxMega
    
    static var current: DeviceSize {
        let screenWidth = UIScreen.main.bounds.width
        
        switch screenWidth {
        case 360:
            return .medium // iPhone 13 Mini
        case 375:
            return .large // iPhone 6, 6s, 7, 8, SE (2. nesil), X, XS, 11 Pro, XR, 11, 12 mini
        case 390:
            return .xLarge // iPhone XS Max, 11 Pro Max, 12, 12 Pro, 13, 13 Pro
        case 414:
            return .xxLarge // iPhone 6 Plus, 6s Plus, 7 Plus, 8 Plus, 12 Pro Max, 13 Pro Max
        case 810:
            return .mega // iPad (5. nesil - 9. nesil), iPad Air (3. nesil - 4. nesil)
        case 834:
            return .xMega // iPad Pro 11" (1. nesil - 3. nesil)
        case 1024:
            return .xxMega // iPad Pro 12.9" (1. nesil - 5. nesil)
        default:
            return .large
        }
    }
}
