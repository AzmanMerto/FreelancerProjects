//
//  PrimaryButton.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text : String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text)
            }
            .tint(.white)
            .font(.title.bold())
            .aspectRatio(contentMode: .fill)
            .frame(height: 50)
        }
        .background {
            Color.shigoPurple
                .padding(.horizontal,-90)
            
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Giriş Yap") {
            
        }
    }
}
