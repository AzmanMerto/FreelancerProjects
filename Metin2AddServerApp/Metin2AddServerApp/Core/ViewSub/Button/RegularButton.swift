//
//  RegularButton.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct RegularButton: View {
    
    var buttonText: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(.system(.callout, design: .default, weight: .black))
                .foregroundColor(.MetinBackground)
        }
        .buttonStyle(RegularButtonStyle())
    }
}

struct RegularButton_Previews: PreviewProvider {
    static var previews: some View {
        RegularButton(buttonText: "1-99 PVP Serverler"){
            
        }
    }
}


private struct RegularButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: UIScreen.main.bounds.width * 0.85,
                           height: 40)
                    .foregroundColor(.MetinYellow)                
            }
    }
}
