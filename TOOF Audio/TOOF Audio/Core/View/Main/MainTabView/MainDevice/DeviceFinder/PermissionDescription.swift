//
//  PermissionDescription.swift
//  TOOF Audio
//
//  Created by Mert Türedü on 5.05.2023.
//

import SwiftUI

struct PermissionDescription: View {
    
    var image: Image
    var text: String
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                image
                    .resizable()
                    .foregroundColor(.ToofButtonColor)
                    .scaledToFit()
                    .frame(width: dh(0.06), height: dh(0.06))
                    .padding(.horizontal)
                Text(text.locale())
                    .foregroundColor(.ToofTextColor)
                Spacer()
            }
            .padding(.leading)
            .frame(maxWidth: .infinity)
        .padding(.vertical)
        }
    }
}


struct PermissionDescription_Previews: PreviewProvider {
    static var previews: some View {
        PermissionDescription(image: Image(""), text: "")
    }
}
