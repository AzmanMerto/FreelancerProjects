//
//  PookaTakeTimeButton.swift
//  FT Times
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct PookaTakeTimeButton: View {
    
    var action : () -> ()
    var text : String
    @Binding var isActive : Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .opacity(isActive ? 1 : 0.6)
        }
        .buttonStyle(PookaTakeTimeButtonStyle())
    }
}

struct PookaTakeTimeButton_Previews: PreviewProvider {
    static var previews: some View {
        PookaTakeTimeButton(action: {
            
        }, text: "", isActive: .constant(false))
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
