//
//  CustomButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct PrimaryButton: View {
    var action : () -> ()
    var text : String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(.white)
                .font(.system(.headline,weight: .bold))
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(action: {
            
        }, text: "")
    }
}
