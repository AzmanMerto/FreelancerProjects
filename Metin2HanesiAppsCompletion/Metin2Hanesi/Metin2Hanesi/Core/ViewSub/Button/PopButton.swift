//
//  PopButton.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct PopButton: View {
    
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            
        }
        .buttonStyle(SliderButtonStyle())
    }
}

struct SlideButton_Previews: PreviewProvider {
    static var previews: some View {
        PopButton{
            
        }
    }
}

struct SliderButtonStyle: ButtonStyle {
        
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
