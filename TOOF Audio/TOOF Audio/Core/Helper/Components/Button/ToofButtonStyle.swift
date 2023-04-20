//
//  ToofButtonStyle.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct ToofButtonStyle: ButtonStyle {
    
    var colorBackground: Color
    var colorStroke: Color?
    var buttonWidth: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width * buttonWidth,
                   height: UIScreen.main.bounds.height * 0.02)
            .background {
                colorBackground.ignoresSafeArea()
                    .cornerRadius(20)
                    
                    .padding(.vertical,-15)
                    .background {
                        colorStroke?.ignoresSafeArea()
                            .padding(.all,-1.5)
                            .cornerRadius(20)
                    }
            }
    }
}
