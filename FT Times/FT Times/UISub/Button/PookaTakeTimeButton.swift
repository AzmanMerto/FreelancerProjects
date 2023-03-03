//
//  PookaTakeTimeButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct PookaTakeTimeButton: View {
    
    @State var isPressed = false
    var action : () -> ()
    
    var body: some View {
        Button {
            action()
            isPressed = true
        } label: {
            Text(isPressed ? "POOKA SÜRESİ ALINDI" : "POOKA SÜRESİ AL")
                .minimumScaleFactor(0.9)
        }
        .opacity(isPressed ? 0.6 : 1)
        .disabled(isPressed)
        .buttonStyle(PookaTakeTimeButtonStyle())
    }
}

struct PookaTakeTimeButton_Previews: PreviewProvider {
    static var previews: some View {
        PookaTakeTimeButton {
            
        }
    }
}

private struct PookaTakeTimeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(.title).bold())
            .padding(.all)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                
            }
    }
}
