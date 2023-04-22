//
//  ToofBackButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct ToofBackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(ImageHelper.auth.customBack.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: dw(0.08))
        }
    }
}


struct ToofBackButton_Previews: PreviewProvider {
    static var previews: some View {
        ToofBackButton()
    }
}
