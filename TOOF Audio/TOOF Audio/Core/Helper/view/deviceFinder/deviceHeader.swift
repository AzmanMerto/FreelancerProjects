//
//  deviceTemplate.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct deviceHeader: View {
    
    var image: String?
    var title: String?
    var description: String?
    
    var body: some View {
        VStack {
            Image(image ?? "")
                .resizable()
                .scaledToFit()
                .frame(height: dw(0.6))
                .padding(.vertical)
            VStack(alignment: .center, spacing: dw(0.1)) {
                Text(title?.locale() ?? "")
                    .font(.default20.bold())
                    .foregroundColor(.ToofTextColor)
                Text(description?.locale() ?? "")
                    .font(.default16)
                    .foregroundColor(.ToofTextColor)
                    .padding(.horizontal,dw(0.1))
            }
            .padding(.horizontal)
            .padding(.vertical)
            .multilineTextAlignment(.center)
        }
    }
}

struct deviceTemplate_Previews: PreviewProvider {
    static var previews: some View {
        deviceHeader(image: "", title: "", description: "")
    }
}
