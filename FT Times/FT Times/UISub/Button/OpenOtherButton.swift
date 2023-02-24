//
//  OpenOtherButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct OpenOtherButton: View {
    
    @Binding var isActive : Bool
    
    var body: some View {
        Button {
            // Start timer
            isActive.toggle()
        } label: {
            Text(isActive ? "ÇALIŞAN SÜRE: 1-1" : "SAYAÇLARI AÇ")
        }
        .compositingGroup()
        .buttonStyle(OpenOtherButtonStyle())
        .disabled(isActive != false)
        .opacity(isActive ? 0.5 : 1)
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
        OpenOtherButton(isActive: .constant(false))
    }
}

