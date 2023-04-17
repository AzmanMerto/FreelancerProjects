//
//  HeaderForAlternativeView.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct HeaderForAlternativeView: View {
    
    @Binding var isShowing: Bool
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.MetinYellow)
                .font(.title3.bold())
            Spacer()
            Button {
                isShowing.toggle()
            } label: {
                Image(ImageHelper.mainView.dismissYellowButton.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderForAlternativeView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderForAlternativeView(isShowing: .constant(false), text: "")
    }
}
