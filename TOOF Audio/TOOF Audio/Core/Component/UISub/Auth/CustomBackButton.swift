//
//  CustomBackButton.swift
//  TOOF Audio
//
//  Created by NomoteteS on 28.03.2023.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(ImageHelper.auth.customBack.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }
            Spacer()
        }
        .padding(.leading)
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
