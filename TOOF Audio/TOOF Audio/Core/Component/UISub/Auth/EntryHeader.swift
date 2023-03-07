//
//  EntryHeader.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct EntryHeader: View {
    var body: some View {
        VStack {
            Image.ToofLogo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
    }
}

struct EntryHeader_Previews: PreviewProvider {
    static var previews: some View {
        EntryHeader()
    }
}
