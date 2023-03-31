//
//  DeviceInfoInRow.swift
//  TOOF Audio
//
//  Created by NomoteteS on 31.03.2023.
//

import SwiftUI

struct DeviceInfoInRow: View {
    
    var textDefinition: String
    var textConclusion: String
    
    var body: some View {
        HStack {
            Text(textDefinition.locale())
                .font(.boldRounded14)
                .foregroundColor(.ToofTextColor)
            Spacer()
            Text(textConclusion)
                .font(.boldRounded14)
                .foregroundColor(.ToofTextColor)
        }
    }
}

struct DeviceInfoInRow_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfoInRow(textDefinition: "", textConclusion: "")
    }
}
