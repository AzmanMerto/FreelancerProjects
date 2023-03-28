//
//  EntryTextField.swift
//  TOOF Audio
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct EntryTextField: View {
    
    var isSecure: Bool
    var isActive: Bool
    var placeholderText: String
    @Binding var bindingText: String
    
    var body: some View {
        ZStack {
            HStack {
                Text(placeholderText.locale())
                    .lineLimit(1)
                    .foregroundColor(.ToofPlaceholder)
                    .opacity(isActive ? 0 : 1)
                Spacer()
            }
            if isSecure {
                SecureField("", text: $bindingText)
                    .foregroundColor(.ToofTextColor)
            }else {
                TextField("", text: $bindingText)
                    .foregroundColor(.ToofTextColor)
            }
        }
        .padding(.horizontal,30)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.ToofTextColor, lineWidth: 1)
                .frame(height: 50)
                .padding(.horizontal)
        }
        .frame(height: 50)
    }
}

struct EntryTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ToofBackgroundColor
                .ignoresSafeArea()
            EntryTextField(isSecure: false,
                           isActive: false,
                           placeholderText: TextHelper.auth.authMailTextFieldPlaceholder.rawValue,
                           bindingText: .constant(""))
        }
    }
}
