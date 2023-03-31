//
//  DeviceInfoInTitle.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct DeviceInfoInTitle: View {
    
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.ToofPlaceholder)
                .frame(height: 20)
            HStack {
                Text(text.locale())
                    .font(.boldRounded14)
                    .foregroundColor(.ToofTextColor)
                Spacer()
            }
            .padding(.leading)
        }
    }
}


struct DeviceInfoInTitle_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfoInTitle(text: "")
    }
}
