//
//  PrimaryChangeView.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct PrimaryChangeView: View {
    
    var text: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.black)
                    .font(.title.bold())
            }
        }

    }
}

struct PrimaryChangeView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryChangeView(text: "") {
            
        }
    }
}
