//
//  DeviceFinderHeader.swift
//  TOOF Audio
//
//  Created by NomoteteS on 29.03.2023.
//

import SwiftUI

struct DeviceFinderHeader: View {
    
    var title: String
    var description: String?
    
    var body: some View {
        VStack(spacing: 30) {
            Text(title)
                .font(.semiDefault20)
            Text(description ?? "")
                .font(.reRounded16)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.ToofTextColor)
    }
}

struct DeviceFinderHeader_Previews: PreviewProvider {
    static var previews: some View {
        DeviceFinderHeader(title: "")
    }
}
