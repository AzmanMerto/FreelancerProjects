//
//  SecondJumperButton.swift
//  FT Times
//
//  Created by NomoteteS on 27.02.2023.
//

import SwiftUI

struct SecJumpButton: View {
    var text : String
    @Binding var isActive : Bool
    var action : () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .opacity(isActive ? 1 : 0.6)
        .disabled(isActive == true)
        .buttonStyle(SecJumpButtonStyle())
    }
}


struct SecJumpButton_Previews: PreviewProvider {
    static var previews: some View {
        SecJumpButton(text: "- ms",isActive: .constant(false), action: {})
    }
}


private struct SecJumpButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.title, weight: .bold))
            .background {
                Color.white
                    .cornerRadius(40)
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(lineWidth: 3)
                        .frame(width: 100,
                               height: 60)
                }
            }
            .frame(width: 100,
                   height: 60)
    }
}
