//
//  SliderValue.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct SliderValue: View {
    
    var text: String
    @State var value : Float
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(text.locale())
                Spacer()
            }
            .font(.boldRounded14)
            .foregroundColor(.ToofTextColor)
            Slider(value: $value, in: -5...5)
            Image(ImageHelper.main.sliderValue.rawValue)
                .resizable()
                .scaledToFit()
        }
        .tint(.ToofButtonColor)
        .padding(.horizontal,50)
    }
}
