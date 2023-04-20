//
//  authSwitchAuthButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 19.04.2023.
//

import SwiftUI

struct authSwitchAuthButton: View {
    
    var text: String
    var altText: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text.locale())
                    .font(.default15).bold()
                    .foregroundColor(.ToofTextColor)
                Text(altText.locale())
                    .font(.default15).bold()
                    .foregroundColor(.ToofButtonColor)
            }
        }

    }
}

struct authSwitchAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            authBackground()
            authSwitchAuthButton(text: "Text", altText: "Text1") {
                
            }
        }
    }
}
