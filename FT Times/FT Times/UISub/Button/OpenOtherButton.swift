//
//  OpenOtherButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct OpenOtherButton: View {

    @Binding var isPressed : Bool
    @Binding var text : String
    
    var action : () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(isPressed ? "ÇALIŞAN SÜRE: \(text)" : "SAYAÇLARI AÇ")
                .opacity(isPressed ? 0.5 : 1)
        }
        .disabled(isPressed)
        .buttonStyle(OpenOtherButtonStyle())
    }
}

private struct OpenOtherButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(.largeTitle,weight: .bold))
            .padding(.all)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
            }
    }
}

struct OpenOtherButton_Previews: PreviewProvider {
    static var previews: some View {
        OpenOtherButton(isPressed: .constant(false),text: .constant("1-1")) {
            
        }
    }
}

