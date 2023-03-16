//
//  Geomerty+Extension.swift
//  FT Times
//
//  Created by NomoteteS on 3.03.2023.
//

import SwiftUI

extension GeometryProxy {
    func dh(_ double: Double) -> Double {
        return size.width * double
    }
    
    func dw(_ double: Double) -> Double {
        return size.height * double
    }
}
