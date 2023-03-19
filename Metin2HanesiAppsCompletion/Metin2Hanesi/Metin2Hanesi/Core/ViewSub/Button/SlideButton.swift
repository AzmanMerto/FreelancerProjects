//
//  SlideButton.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct SlideButton: View {
    
    var isActived: Bool
    
    var body: some View {
        Button {
            
        } label: {
            
        }
        .buttonStyle(SliderButtonStyle(isActive: isActived))
    }
}

struct SlideButton_Previews: PreviewProvider {
    static var previews: some View {
        SlideButton(isActived: false)
    }
}

struct SliderButtonStyle: ButtonStyle {
    
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.MetinYellow)
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.MetinYellow)
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.MetinYellow)
        }
        .frame(width: 40, height: 37)
    }
}
