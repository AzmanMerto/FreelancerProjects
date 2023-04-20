//
//  ToofButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct ToofButton: View {
    @State var isLoading: Bool = false
    var buttonText: String
    var action: () -> ()
    var body: some View {
        Button {
            action()
            isLoading.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading.toggle()
            }
        } label: {
            if isLoading {
                ProgressView()
            } else {
                Text(buttonText.locale())
                    .font(.default16).bold()
                    .foregroundColor(.ToofTextColor)
            }
        }
        .buttonStyle(ToofButtonStyle(colorBackground: Color.ToofButtonColor, buttonWidth: 0.8))
        .disabled(isLoading)
    }
}



struct ToofButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            authBackground()
            ToofButton(buttonText: "ToofButton"){
                
            }
        }
    }
}

