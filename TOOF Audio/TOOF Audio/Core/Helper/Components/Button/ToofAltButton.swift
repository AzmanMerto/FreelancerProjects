//
//  ToofAltButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct ToofAltButton: View {
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
                    .foregroundColor(.ToofButtonColor)
            }
        }
        .buttonStyle(ToofButtonStyle(colorBackground: Color.ToofTextColor, colorStroke: Color.ToofButtonColor, buttonWidth: 0.6))
        .disabled(isLoading)
    }
}

struct ToofAltButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor.ignoresSafeArea()
            ToofAltButton(buttonText: "ToofAltButton") {
                
            }
        }
    }
}
