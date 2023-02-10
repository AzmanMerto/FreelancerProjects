//
//  Image+Extensions.swift
//  Shigo
//
//  Created by NomoteteS on 10.02.2023.
//

import SwiftUI

extension Image {
    func SplashViewLines() -> some View {
        self
            .resizable()
            .frame(height: UIScreen.main.bounds.height * 0.2)
    }
}
