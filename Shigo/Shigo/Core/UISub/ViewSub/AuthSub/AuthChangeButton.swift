//
//  AuthChangeButton.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct AuthChangeButton: View {
    
    var text: String
    var color: Color?
    var textColor: Color?
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(color ?? .white)
                Text(text)
                    .foregroundColor(textColor ?? .black)
                    .font(.title.bold())
            }
        }

    }
}

struct PrimaryChangeView_Previews: PreviewProvider {
    static var previews: some View {
        AuthChangeButton(text: "") {
            
        }
    }
}
