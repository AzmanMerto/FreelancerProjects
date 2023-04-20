//
//  authBackground.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct authBackground: View {
    
    private var x = 0.5
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors:
                                        [.ToofPlaceholder,
                                         Color(red: 116/244, green: 121/244, blue: 126/244),
                                         Color(red: 69/244, green: 75/244, blue: 81/244),
                                         Color(red: 47/244, green: 54/244, blue: 61/244),
                                         .ToofBackgroundColor]),
                           startPoint: .init(x: self.x, y: 0),
                           endPoint: .init(x: self.x, y: 0.65))
            .ignoresSafeArea()
        }
    }
}

struct authBackground_Previews: PreviewProvider {
    static var previews: some View {
        authBackground()
    }
}
