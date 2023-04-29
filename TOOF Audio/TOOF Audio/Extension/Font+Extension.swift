//
//  Font+Extension.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.04.2023.
//

import SwiftUI

extension Font {
    static func dynamicDefaultFontSize(size: CGFloat) -> Font {
        switch DeviceSize.current {
        case .medium:
            return .system(size: size, design: .default)
        case .large:
            return .system(size: size, design: .default)
        case .xLarge:
            return .system(size: size, design: .default)
        case .xxLarge:
            return .system(size: size, design: .default)
        case .mega:
            return .system(size: size * 2, design: .default)
        case .xMega:
            return .system(size: size * 2, design: .default)
        case .xxMega:
            return .system(size: size * 2, design: .default)
        }
    }
}
