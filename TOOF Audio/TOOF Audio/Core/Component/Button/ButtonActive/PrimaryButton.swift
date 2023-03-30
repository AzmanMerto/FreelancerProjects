//
//  CustomButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 24.02.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    @State var text : String
    @State var size: CGSize?
    @State var textColor: Color?
    @State var backgroundColor: Color?
    var action : () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.locale())
        }
        .frame(height: 48)
        .buttonStyle(PrimaryButtonStyle(size: size ?? CGSize(width: 280,height: 50),
                                        textColor: textColor ?? .ToofTextColor,
                                        buttonColor: backgroundColor ?? .ToofButtonColor))
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Custom Button", size: CGSize(width: 156,
                                             height: 48)) {
            
        }
    }
}


struct PrimaryButtonStyle: ButtonStyle {
    
    @State var size: CGSize
    @State var textColor: Color
    @State var buttonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .font(.boldRounded14)
            .background{
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: size.width,
                           height: size.height)
                    .foregroundColor(buttonColor)
            }
    }
}
