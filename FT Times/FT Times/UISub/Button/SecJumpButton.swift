//
//  SecondJumperButton.swift
//  FT Times
//
//  Created by NomoteteS on 27.02.2023.
//

import SwiftUI

struct SecJumpButton: View {
    
    var size : CGSize
    var text : String
    var action : () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .font(.system(.title).bold())
        .tint(.black)
        .background {
            Color.white
                .cornerRadius(40)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(lineWidth: 2)
                    .frame(width: size.width,
                           height: size.height)
            }
        }
        .frame(width: size.width,
               height: size.height)
    }
}

struct SecJumpButton_Previews: PreviewProvider {
    static var previews: some View {
        SecJumpButton(size: CGSize(width: 100, height: 70),
                      text: "- ms",
                      action: {})
    }
}
