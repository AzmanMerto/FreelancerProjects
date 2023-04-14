//
//  ChatButton.swift
//  Metin2AddServerApp
//
//  Created by NomoteteS on 16.03.2023.
//

import SwiftUI

struct ChatButton: View {
    
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image("chatButton")
                .resizable()
        }
        .frame(width: 40, height: 37)
    }
}

struct ChatButton_Previews: PreviewProvider {
    static var previews: some View {
        ChatButton{
            
        }
    }
}
