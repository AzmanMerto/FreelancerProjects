//
//  PookaTakeTimeButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct PookaTakeTimeButton: View {
    
    @State var isPressed = false
    
    var body: some View {
        Button {
            isPressed = true
        } label: {
            Text(isPressed ? "POOKA SÜRESİ ALINDI" : "POOKA SÜRESİ AL")
        }
        .disabled(isPressed)
        .buttonStyle(PookaTakeTimeButtonStyle())
    }
}

struct PookaTakeTimeButton_Previews: PreviewProvider {
    static var previews: some View {
        PookaTakeTimeButton()
    }
}

private struct PookaTakeTimeButtonStyle: ButtonStyle {
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
